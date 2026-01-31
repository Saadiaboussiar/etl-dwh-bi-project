CREATE TABLE fact_trips (
    fact_trip_key BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    
    -- Keys for your dimensions
    route_key BIGINT NOT NULL,
    truck_key BIGINT NOT NULL,
    date_key INT NOT NULL,  -- Links to dim_date
    
    -- Metrics (The "Facts")
    miles_driven BIGINT,
    base_cost DOUBLE,
    fuel_cost DOUBLE,
    total_cost DOUBLE,
    
    -- Establishing Foreign Key Constraints
    CONSTRAINT fk_route_link FOREIGN KEY (route_key) 
        REFERENCES dim_route(route_key),
        
    CONSTRAINT fk_truck_link FOREIGN KEY (truck_key) 
        REFERENCES dim_truck(truck_key),
        
    CONSTRAINT fk_date_link FOREIGN KEY (date_key) 
        REFERENCES dim_date(date_key)
);