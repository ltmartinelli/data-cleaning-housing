-- Populate Property Address using ParcelID as reference

UPDATE nashville_housing
	SET propertyaddress = replacement
	FROM
	(
		SELECT DISTINCT a.uniqueid as id, b.propertyaddress as replacement
		FROM nashville_housing AS a
		JOIN nashville_housing AS b
			ON a.parcelid = b.parcelid
			AND a.uniqueid != b.uniqueid
		WHERE a.propertyaddress IS NULL
	) AS temp
	WHERE nashville_housing.uniqueid = temp.id
	
-- Break Address into columns

-- With substrings

ALTER TABLE nashville_housing
	ADD propertyaddresssplit VARCHAR(255);
UPDATE nashville_housing
	SET propertyaddresssplit = SUBSTRING(propertyaddress,1, POSITION(',' IN propertyaddress)-1)

ALTER TABLE nashville_housing
	ADD propertycitysplit VARCHAR(255)
UPDATE nashville_housing							
SET propertycitysplit = SUBSTRING(propertyaddress, POSITION(',' IN propertyaddress)+1, LENGTH(propertyaddress))
	
-- With SPLIT_PART()

ALTER TABLE nashville_housing
	ADD owneraddresssplit VARCHAR(255);
UPDATE nashville_housing
	SET owneraddresssplit = SPLIT_PART(owneraddress,',',1)
	
ALTER TABLE nashville_housing
	ADD ownercitysplit VARCHAR(255);
UPDATE nashville_housing
	SET ownercitysplit = SPLIT_PART(owneraddress,',',2)

ALTER TABLE nashville_housing
	ADD ownerstatesplit VARCHAR(255);
UPDATE nashville_housing
	SET ownerstatesplit = SPLIT_PART(owneraddress,',',3)

-- Change Y and N -> Yes and No in "Sold as Vacant"

UPDATE nashville_housing
SET soldasvacant = CASE 
		WHEN soldasvacant = 'Y' THEN 'Yes'
		WHEN soldasvacant = 'N' THEN 'No'
		ELSE soldasvacant
	   	END


