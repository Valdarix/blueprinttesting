---
globs: "sql/**,server/modules/**"
---

# Database

## OxMySQL Patterns
- Always use parameterized queries: `MySQL.query('SELECT * FROM t WHERE id = ?', { id })`
- Never concatenate user input into SQL strings
- Use `MySQL.insert`, `MySQL.update`, `MySQL.query` appropriately
- Async patterns: use callbacks or `MySQL.query.await` for synchronous flow

## Schema Design
- Table names: `foundation_mdt_` prefix, snake_case
- Column names: snake_case
- Include `created_at` and `updated_at` timestamps
- Use JSON columns for flexible data (charges, evidence lists)
- Add indexes for columns in WHERE, ORDER BY, JOIN clauses
- Use ENUM for status fields with known values

## Migrations
- New tables/changes go in `sql/` directory
- Name migrations descriptively: `add_warrant_priority_column.sql`
- Never edit applied migrations — create new ones
