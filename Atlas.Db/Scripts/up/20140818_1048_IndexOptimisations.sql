CREATE INDEX [IX_transactions_reference_number_sequence_number] ON [transactions] ([reference_number], [sequence_number])
CREATE INDEX [IX_users_client_id_card_holder_identifier] ON [users] ([client_id], [card_holder_identifier])
CREATE INDEX [IX_account_balances_account_id] ON [account_balances] ([account_id])
CREATE INDEX [IX_accounts_user_id] ON [accounts] ([user_id])