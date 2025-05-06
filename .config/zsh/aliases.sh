alias ll='ls -lhA --color=always | awk '\''BEGIN {
  printf "\033[1;34m%-10s %-20s %s\033[0m\n", "Size", "Last Modified", "Name"
  printf "\033[1;34m%-10s %-20s %s\033[0m\n", "----------", "--------------------", "-----------------------------"
}
$1 != "total" {
  size_raw = $5
  split(size_raw, num_unit, /([KMGTP])/)
  num = num_unit[1]
  unit = num_unit[2]
  factor = 1
  if (unit == "K") factor = 1024
  else if (unit == "M") factor = 1024^2
  else if (unit == "G") factor = 1024^3
  else if (unit == "T") factor = 1024^4
  else if (unit == "P") factor = 1024^5
  total_bytes += num * factor

  count += 1
  date=$6 " " $7 " " $8;
  name = "";
  for (i=9; i<=NF; i++) name = name $i " ";
  printf "\033[0m%-10s %-20s %s\n", size_raw, date, name
}
END {
  hum = total_bytes
  suffix = "B"
  if (hum > 1024) { hum /= 1024; suffix = "K" }
  if (hum > 1024) { hum /= 1024; suffix = "M" }
  if (hum > 1024) { hum /= 1024; suffix = "G" }
  if (hum > 1024) { hum /= 1024; suffix = "T" }

  printf "\033[1;34m%s\033[0m\n", "-------------------------------------------------------------"
  printf "\033[1;34m%-60s\033[0m\n", "Count: " count " | Total Size: " sprintf("%.1f%s", hum, suffix)
}'\'''
