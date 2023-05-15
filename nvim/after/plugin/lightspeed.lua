---@diagnostic disable: undefined-global
local status_ok, lightspeed = pcall(require, 'lightspeed')
if not status_ok then return end

lightspeed.setup {
  -- jump_to_first_match = true,
  jump_to_unique_chars = { safety_timeouts = 401 },
  -- This can get _really_ slow if the window has a lot of content,
  -- turn it on only if your machine can always cope with it.
  -- highlight_unique_chars = false,
  match_only_the_start_of_same_char_seqs = true,
  limit_ft_matches = 6,
  -- full_inclusive_prefix_key = '<c-x>',
  -- By default, the values of these will be decided at runtime,
  -- based on `jump_to_first_match`.
  labels = nil,
  cycle_group_fwd_key = nil,
  cycle_group_bwd_key = nil,
}
