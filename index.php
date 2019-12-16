<?php

if (filter_has_var(INPUT_GET, "name")) {
    echo 'have';
} else {
    echo "has not";
}
