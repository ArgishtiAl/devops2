#!/bin/bash

log_random_number() {
    local number=$1
    logger -t "randomly[$$]" -p user.info "Random Number: $number"
}

for i in {1..3}; do
    random_number=$RANDOM
    echo "Random Number: $random_number"
    log_random_number "$random_number"
done

