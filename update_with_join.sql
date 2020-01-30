UPDATE ips INNER JOIN country
    ON ips.iso = country.iso
SET ips.countryid = country.countryid;
