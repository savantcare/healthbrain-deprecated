# Why
# 1. There is no delete related 4 fields since it is a time travel DB
# 2. There is no need for firstParentID and discontinue related 4 fields and since it will be MariDB temporal feature

ALTER TABLE `birthplace`
  DROP `firstParentID`,
  DROP `deletedByUID`,
  DROP `deletedOnDateTime`,
  DROP `deletedOnTimeZone`,
  DROP `deletedFromIPAddress`,
  DROP `discontinuedByUID`,
  DROP `discontinuedOnDateTime`,
  DROP `discontinuedOnTimeZone`,


# Why
# 1. Notes can be written both during creation and deletion
ALTER TABLE `birthplace` CHANGE `discontinueNotes` `notes` TEXT CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL;

# Why
# 1. ipaddress and created (3 fields) needs to be recorded both during creation and deletion
ALTER TABLE `birthplace` CHANGE `discontinuedFromIPAddress` `recordChangeFromIPAddress` VARCHAR(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL;
ALTER TABLE `birthplace` CHANGE `createdByUID` `recordChangeByUID` INT(11) UNSIGNED NULL DEFAULT NULL;
ALTER TABLE `birthplace` CHANGE `createdOnDateTime` `recordChangeOnDateTime` DATETIME NULL DEFAULT NULL;
ALTER TABLE `birthplace` CHANGE `createdOnTimeZone` `recordChangeOnTimeZone` VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL;

# Why?
# Proper ordering helps
ALTER TABLE `birthplace` CHANGE `notes` `notes` TEXT CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `value`

# Why?
# Enabled temporal DB
ALTER TABLE birthplace ADD SYSTEM VERSIONING;
# Ref: https://mariadb.com/kb/en/temporal-data-tables/#adding-or-removing-system-versioning-tofrom-a-table


# How to see the extra columns created give the command?
# SELECT value, ROW_START, ROW_END FROM birthplace;
# Ref: https://mariadb.com/kb/en/temporal-data-tables/

# How to see all records that were also deleted?
SELECT * FROM birthplace FOR SYSTEM_TIME ALL;
# Ref: https://mariadb.com/kb/en/temporal-data-tables/#querying-historical-data

# How to see rows between start and end time?
SELECT * FROM birthplace FOR SYSTEM_TIME BETWEEN (NOW() - INTERVAL 1 YEAR) AND NOW();

# TODO:
# Question1: Can this table be partitioned
# While primary keys are supported on partitioned tables, foreign keys referencing partitioned tables are not supported. (Foreign key references from a partitioned table to some other table are supported
# Ref: https://mariadb.com/kb/en/temporal-data-tables/+comments/3678
# https://mariadb.com/kb/en/temporal-data-tables/#storing-the-history-separately

# Question2: How should time be stored
# Seems like UTC is a easier option

# Question 3: Can the user who created it be stored coming from mysql user and the app users mapped to mysql user 
