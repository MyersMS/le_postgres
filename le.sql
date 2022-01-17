SELECT		
	--COUNT(pc.code) AS "Postal Code Count",	
	pc.code AS "Postal Code",	
	pc.country AS "Country Code",	
	CASE	
		WHEN le.type_id = '0' THEN 'CFU_Delivery'
		WHEN le.type_id = '1' THEN 'CFU_Return'
		WHEN le.type_id = '2' THEN 'CFU_Swap'
		WHEN le.type_id = '3' THEN 'CFU_Repair'
		WHEN le.type_id = '4' THEN 'Accessories'
	END "Type",	
	CASE	
		WHEN le.is_eligible = '0' THEN 'eligible'
		WHEN le.is_eligible = '1' THEN 'not_eligible'
		WHEN le.is_eligible = '2' THEN 'hold'
	END "Is Eligible",	
	CASE	
		WHEN le.product_line = '0' THEN 'Ruby'
		WHEN le.product_line = '1' THEN 'Titan'
		WHEN le.product_line = '2' THEN 'Aurora'
		WHEN le.product_line = '3' THEN 'Prism'
		WHEN le.product_line = '4' THEN 'Accessories'
	END "Product Line",	
	w.code AS warehouse_code,	
	pc.delivery_zone,	
	--pc.delivery_zone,	
	--pc.service_zone	
	pc.can_ship_to	
FROM		
	postalcode pc	
		
	LEFT JOIN	
		shipmentquoteprices sqp ON pc.shipment_quote_prices_id = sqp.pk
	LEFT JOIN 	
		warehouse w ON pc.warehouse_id = w.pk
	LEFT JOIN 	
		logistics_eligible le ON pc.pk = le.postal_code_id
		
	-- LEFT JOIN shipmentquoteprices sqp ON pc.shipment_quote_prices_id = sqp.pk	
--WHERE pc.can_ship_to != 'True'		
		
WHERE		
	le.is_eligible IS NOT NULL	
		
	--AND le.product_line IN ('0','1')	
		
	AND	
		le.is_eligible IN ('0')
	--AND le.type_id = '0'	
		
	AND 	
		pc.country IN ('CA')
	--AND pc.code LIKE 'BT%'	
	--AND pc.country = 'AU'	
	--AND w.code LIKE 'winnings%'	
	--AND sqp.first_bike_price_in_cents = '0'	
	--AND w.partner_flag != 'peloton-fsl'	
	--AND pc.code = '30318'	
		
	AND	
		pc.code IN ('B0J')
	--AND pc.delivery_zone LIKE '%point%'	
	--AND pc.code = 'KW15'	
	--AND CONCAT(pc.country, pc.code) IN ()	
	--AND pc.can_ship_to != 'TRUE'	
	--AND w.code IN ('amj_warehouse_halifax')	
	--AND w.partner_flag = 'jbhunt'	
	--ORDER BY  pc.country ASC, w.code desc, le.product_line ASC, le.type_id ASC, le.is_eligible ASC, pc.code ASC	
	--GROUP BY pc.country, pc.can_ship_to, le.type_id, le.product_line, le.is_eligible --, w.code	
	--LIMIT 100	
		
ORDER BY 		
	w.code ASC, pc.code ASC,"Product Line", "Type"	
--OFFSET 5000		
--OFFSET 10000		
--OFFSET 15000		
--OFFSET 75000		
--LIMIT 5000		
		
--SELECT DISTINCT w.code FROM postalcode pc inner JOIN warehouse w ON w.pk = pc.warehouse_id		
	--'peloton_warehouse_north_boston',	
	--'peloton_warehouse_brooklyn_hts',	
	--'peloton_warehouse_cranberry_twp',	
	--'peloton_warehouse_dayton',	
	--'peloton_warehouse_denver',	
	--'peloton_warehouse_boston',	
	--'peloton_warehouse_hazelwood',	
	--'peloton_warehouse_lakelAND',	
	--'peloton_warehouse_minneapolis',	
	--'peloton_warehouse_atlanta',	
	--'peloton_warehouse_sanmarcos',	
	--'peloton_warehouse_detroit',	
	--'peloton_warehouse_syosset',	
	--'peloton_warehouse_toronto_ca',	
	--'peloton_warehouse_northampton',	
	--'peloton_warehouse_rochdale',	
	--'peloton_warehouse_north_acton',	
	--'peloton_warehouse_croydon',	
	--'peloton_warehouse_salt_lake_city',	
	--'peloton_warehouse_edinburgh'	
		
--SELECT order_id, partner_id,delivery_status FROM shipment WHERE order_id IN () AND partner_flag = 'xpo-clm' -- AND partner_id LIKE '000%'		
