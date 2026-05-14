CREATE TABLE customers(
    customer_id             UUID PRIMARY KEY,
    company_name            VARCHAR(100),
    industry                VARCHAR(100),
    country                 VARCHAR(100),
    plan_type               VARCHAR(100),
    mrr                     INTEGER,
    contract_start          DATE,
    contract_end            DATE,
    churned                 BOOLEAN,
    churned_date            DATE,
    employee_count          INTEGER,
    health_score            INTEGER
);

CREATE TABLE subscriptions(
    sub_id                  UUID PRIMARY KEY,
    customer_id             UUID,
    plan                    VARCHAR(100),
    billing_cycle           VARCHAR(100),
    start_date              DATE,
    end_date                DATE,
    discount_pct            INTEGER,
    payment_method          VARCHAR(100),
    last_payment_status     VARCHAR(100),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE usage_logs(
    log_id                  UUID PRIMARY KEY,
    customer_id             UUID,
    user_id                 UUID,
    event_date              DATE,
    feature_used            VARCHAR(100),
    session_duration_min    INTEGER,
    login_count             INTEGER,
    actions_count           INTEGER,
    device_type             VARCHAR(100),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE support_tickets(
    ticket_id               UUID PRIMARY KEY,
    customer_id             UUID,
    created_at              DATE,
    resolved_at             DATE,
    category                VARCHAR(100),
    priority                VARCHAR(100),
    sentiment_score         NUMERIC,
    csat_score              INTEGER,
    escalated               BOOLEAN,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);