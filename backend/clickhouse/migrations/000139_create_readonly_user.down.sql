DROP USER IF EXISTS highlight_readonly;
DROP ROLE IF EXISTS highlight_readonly_role;
DROP ROW POLICY IF EXISTS error_groups_readonly ON error_groups;
DROP ROW POLICY IF EXISTS error_objects_readonly ON error_objects;
DROP ROW POLICY IF EXISTS errors_joined_vw_readonly ON errors_joined_vw;
DROP ROW POLICY IF EXISTS sessions_readonly ON sessions;
DROP ROW POLICY IF EXISTS sessions_joined_vw_readonly ON sessions_joined_vw;
DROP ROW POLICY IF EXISTS session_events_vw_readonly ON session_events_vw;
DROP ROW POLICY IF EXISTS fields_readonly ON fields;
DROP ROW POLICY IF EXISTS traces_readonly ON traces;
DROP ROW POLICY IF EXISTS traces_sampling_new_readonly ON traces_sampling_new;
DROP ROW POLICY IF EXISTS logs_readonly ON logs;
DROP ROW POLICY IF EXISTS logs_sampling_readonly ON logs_sampling;