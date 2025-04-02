#!/bin/sh
for i in $(env | grep VITE_)
do
    key=$(echo $i | cut -d '=' -f 1)
    value=$(echo $i | cut -d '=' -f 2-)
     wrapped_value="'$value'"
    find /usr/share/nginx/html -type f \( -name '*.js' -o -name '*.css' \) -exec sed -i "s|${key}|${wrapped_value}|g" '{}' +
    echo "Replacing: $key=$wrapped_value"
done
exec "$@"
