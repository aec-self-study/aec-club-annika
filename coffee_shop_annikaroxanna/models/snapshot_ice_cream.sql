--{% snapshot favorite_ice_cream_flavors %}
 
--{{ config(
 --     target_schema='dbt_annika_snapshots',
 --     unique_key='github_username',
 --     strategy='timestamp',
 --     updated_at='updated_at',
 --) }}
 
--select
  --  *
 --from `analytics-engineers-club.advanced_dbt_examples.favorite_ice_cream_flavors`
 
--{% endsnapshot %}