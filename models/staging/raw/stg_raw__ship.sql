WITH source AS (
    SELECT * FROM {{ source('raw', 'ship') }}
),

filtered AS (
    -- Vérification des différences entre shipping_fee et shipping_fee_1
    SELECT *
    FROM source
    WHERE shipping_fee <> shipping_fee_1
),

renamed AS (
    SELECT
        orders_id,
        shipping_fee,  -- Supposons que cette colonne est correcte après vérification
        logcost,
        CAST(ship_cost AS FLOAT64) AS ship_cost  -- Conversion en FLOAT64
    FROM source
)

SELECT * FROM renamed