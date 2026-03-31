/*
  Seed data for the cx_opportunities dimension table.
  Run this once to populate the 7 opportunities reference table.
  Adjust the schema name to match your warehouse.
*/

CREATE TABLE IF NOT EXISTS schema.cx_opportunities (
  opportunity_id                    VARCHAR(10)   PRIMARY KEY,
  opportunity_name                  VARCHAR(200)  NOT NULL,
  opportunity_short_name            VARCHAR(50)   NOT NULL,
  sort_order                        INT           NOT NULL,
  description                       TEXT,
  owner                             VARCHAR(100),
  status                            VARCHAR(20)   DEFAULT 'not_started',
  estimated_contact_volume_reduction INT,
  estimated_cost_savings            DECIMAL(12,2),
  primary_goal_ids                  VARCHAR(50),
  target_start_date                 DATE,
  target_end_date                   DATE
);

TRUNCATE TABLE schema.cx_opportunities;

INSERT INTO schema.cx_opportunities
  (opportunity_id, opportunity_name, opportunity_short_name, sort_order, description, primary_goal_ids, target_start_date, target_end_date)
VALUES
('opp_1',
 'Reducing incorrect/inaccessible email address contacts',
 'Email Address',
 1,
 'Reduce inbound contacts caused by customers unable to access accounts due to incorrect or outdated email addresses.',
 'goal_1,goal_5',
 '2026-01-01', '2026-06-30'),

('opp_2',
 'Account Sharing inquiry surge — mitigation with Product & Technology',
 'Account Sharing',
 2,
 'Anticipate and mitigate the increase in inquiries from account sharing policy/product changes through proactive deflection.',
 'goal_2,goal_4,goal_5',
 '2026-01-01', '2026-09-30'),

('opp_3',
 'Exploring OTP journey pain points',
 'OTP Journey',
 3,
 'Analyze data to identify where customers fail, retry, or abandon the OTP authentication flow.',
 'goal_1,goal_5',
 '2026-02-01', '2026-07-31'),

('opp_4',
 'Disney bundle activation — customer confusion',
 'Disney Bundle',
 4,
 'Root-cause and reduce customer confusion during the Disney bundle activation flow.',
 'goal_1,goal_3,goal_5',
 '2026-01-01', '2026-08-31'),

('opp_5',
 'Evaluate automation for FCCA & third-party cancellations',
 'FCCA / 3P Cancel',
 5,
 'Evaluate and implement automation for first-contact cancellation attempts and third-party cancellations.',
 'goal_2,goal_4',
 '2026-03-01', '2026-09-30'),

('opp_6',
 'Refund issues & automation opportunities',
 'Refunds',
 6,
 'Identify refund scenarios suitable for automation and reduce refund-related contact volume and cost.',
 'goal_2,goal_4,goal_5',
 '2026-02-01', '2026-10-31'),

('opp_7',
 'Additional deflection levers to reduce spam',
 'Spam Deflection',
 7,
 'Implement additional deflection mechanisms to reduce spam and non-actionable contacts.',
 'goal_4,goal_5',
 '2026-01-01', '2026-12-31');
