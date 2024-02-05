#!/bin/bash
output_file="seismic_travel_times_PKP_phase.csv"

echo "Distance,TravelTime" > "$output_file"

for distance in $(seq 0 10 180); do
    travel_time=$(taup_time -mod ak135 -h 0 -deg $distance -ph PKP | grep -m 1 'PKP' | awk '{print $4}')
  
    echo "$distance,$travel_time" >> "$output_file"
done

echo "Data collection complete. Output stored in $output_file"

