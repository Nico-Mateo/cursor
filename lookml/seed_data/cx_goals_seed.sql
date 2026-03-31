/*
  Seed data for the cx_goals dimension table.
  Run this once to populate the goals reference table.
  Adjust the schema name to match your warehouse.
*/

CREATE TABLE IF NOT EXISTS schema.cx_goals (
  goal_id       VARCHAR(10)   PRIMARY KEY,
  goal_name     VARCHAR(200)  NOT NULL,
  goal_short_name VARCHAR(50) NOT NULL,
  sort_order    INT           NOT NULL,
  description   TEXT
);

TRUNCATE TABLE schema.cx_goals;

INSERT INTO schema.cx_goals (goal_id, goal_name, goal_short_name, sort_order, description) VALUES
('goal_1', 'Provide faster, more effective 1:1 support across all CX touchpoints',
           '1:1 Support', 1,
           'Targets: 90%+ FCR, reduce total time per contact by 2 min'),

('goal_2', 'Automate customer interactions where a human doesn''t add value',
           'Automation', 2,
           'Targets: 75%+ self-service rate (+5pp), +20pp chatbot CSAT, 90% advocate accuracy within 30 days'),

('goal_3', 'Leverage AI & Automation to reinforce quality at scale',
           'Quality at Scale', 3,
           'Targets: 94% global CSAT, <5pt CSAT variance between markets'),

('goal_4', 'Aggressively optimize top cost drivers to drive efficiency, quality, scale',
           'Cost Optimization', 4,
           'Targets: 15% YoY reduction in global cost per case, $$$M run-rate savings by EOY'),

('goal_5', 'Identify/Eliminate top contact drivers to improve growth, satisfaction, engagement',
           'Eliminate Contact Drivers', 5,
           'Targets: 25% reduced contact rate, 15+ improvements surfaced, 4.0 tech contact rate');
