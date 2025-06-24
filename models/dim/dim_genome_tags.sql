WITH src_tags AS (
    SELECT DISTINCT tag
    FROM {{ ref('src_tags') }}
    WHERE tag IS NOT NULL
)

SELECT 
    MD5(TRIM(tag)) AS tag_id,
    INITCAP(TRIM(tag)) AS tag_name
FROM src_tags
