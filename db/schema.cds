using {
    cuid,
    managed
} from '@sap/cds/common';


context dimensions {

    entity dim_campaigns : cuid {

        key campaign_id   : String(12);
            campaign_name : String(12);
            start_date    : Date;
            end_date      : Date


    }

    entity dim_products : cuid {

        key product_code : String(12);
            product_name : String(12);
            category     : String(12)

    }

    entity dim_stores : cuid {

        key store_id : String(12);
            city     : String(12)
    }

}

context facts {

    entity fact_events : cuid {

        key event_id                   : String(12);
            store_id                   : Association to dimensions.dim_stores;
            campaign_id                : Association to dimensions.dim_campaigns;
            product_code               : Association to dimensions.dim_products;
            base_price                 : Decimal(2, 5); //The standard price of the product before any promotional discount.
            promo_type                 : String(12); //The type of promotion applied (e.g., percentage discount, BOGOF(Buy One Get One Free), cashback).
            quantity_sold_before_promo : Integer; //The number of units sold in the week immediately preceding the start of the campaign, serving as a baseline for comparison with promotional sales.
            quantity_sold_after_promo  : Integer //The quantity of the product sold after the promotion was applied.

    }
}
