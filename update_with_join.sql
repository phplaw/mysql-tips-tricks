UPDATE ips INNER JOIN country
    ON ips.iso = country.iso
SET ips.countryid = country.countryid;

-- update
UPDATE `account_transactions` SET `created` = UNIX_TIMESTAMP(`transaction_datetime`) WHERE created IS NULL;

