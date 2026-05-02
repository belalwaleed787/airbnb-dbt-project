{% macro log_row_lineage(source_model_name) %}

    insert into {{ source('airbnb', 'lineage_events') }} (
        lineage_event_id,
        source_table,
        source_id,
        target_table,
        target_id,
        lineage_id,
        process_name,
        run_id,
        confidence,
        hash_chain,
        created_at
    )
    select
        uuid_string(),
        '{{ source_model_name }}',
        cast(ID as string),
        '{{ this }}',
        cast(host_id as string),
        cast(UUID_STRING() as string),
        '{{ this.name }}',
        '{{ invocation_id }}',
        100.00,
        md5(
            coalesce(cast(ID as string as string), '') || '|' ||
            coalesce(cast(host_id as string), '') || '|' ||
            coalesce(cast(UUID_STRING() as string), '') || '|' ||
            '{{ this.name }}'
        ),
        current_timestamp()
    from {{ this }}
    where host_id is not null
      and lineage_id is not null
      and ID is not null
    ;

    insert into {{ source('airbnb', 'lineage_links') }} (
        target_table,
        target_id,
        lineage_id,
        lineage_event_id,
        run_id,
        created_at
    )
    select
        target_table,
        target_id,
        lineage_id,
        lineage_event_id,
        run_id,
        created_at
    from lineage_events
    where run_id = '{{ invocation_id }}'
      and target_table = '{{ this }}'
      and process_name = '{{ this.name }}'
    ;

{% endmacro %}