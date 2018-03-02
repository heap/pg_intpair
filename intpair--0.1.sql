
CREATE FUNCTION app_user_id_in(cstring)
RETURNS app_user_id
AS 'MODULE_PATHNAME', 'app_user_id_in'
LANGUAGE C STRICT IMMUTABLE;

CREATE FUNCTION app_user_id_out(app_user_id)
RETURNS cstring
AS 'MODULE_PATHNAME', 'app_user_id_out'
LANGUAGE C STRICT IMMUTABLE;

CREATE FUNCTION app_user_id(BIGINT, BIGINT)
RETURNS app_user_id
AS 'MODULE_PATHNAME', 'app_user_id_make'
LANGUAGE C STRICT IMMUTABLE;

CREATE FUNCTION app_user_id_lt(app_user_id, app_user_id)
RETURNS BOOLEAN
AS 'MODULE_PATHNAME', 'app_user_id_lt'
LANGUAGE C STRICT IMMUTABLE;

CREATE FUNCTION app_user_id_lte(app_user_id, app_user_id)
RETURNS BOOLEAN
AS 'MODULE_PATHNAME', 'app_user_id_lte'
LANGUAGE C STRICT IMMUTABLE;

CREATE FUNCTION app_user_id_eq(app_user_id, app_user_id)
RETURNS BOOLEAN
AS 'MODULE_PATHNAME', 'app_user_id_eq'
LANGUAGE C STRICT IMMUTABLE;

CREATE FUNCTION app_user_id_neq(app_user_id, app_user_id)
RETURNS BOOLEAN
AS 'MODULE_PATHNAME', 'app_user_id_neq'
LANGUAGE C STRICT IMMUTABLE;

CREATE FUNCTION app_user_id_gt(app_user_id, app_user_id)
RETURNS BOOLEAN
AS 'MODULE_PATHNAME', 'app_user_id_gt'
LANGUAGE C STRICT IMMUTABLE;

CREATE FUNCTION app_user_id_gte(app_user_id, app_user_id)
RETURNS BOOLEAN
AS 'MODULE_PATHNAME', 'app_user_id_gte'
LANGUAGE C STRICT IMMUTABLE;

CREATE FUNCTION app_user_id_cmp(app_user_id, app_user_id)
RETURNS INTEGER
AS 'MODULE_PATHNAME', 'app_user_id_cmp'
LANGUAGE C STRICT IMMUTABLE;

CREATE FUNCTION app_user_id_hash(app_user_id)
RETURNS INTEGER
AS 'MODULE_PATHNAME', 'app_user_id_hash'
LANGUAGE C STRICT IMMUTABLE;

CREATE TYPE app_user_id (
    INPUT = app_user_id_in,
    OUTPUT = app_user_id_out,
    INTERNALLENGTH = 16,
    ELEMENT = int8,
    STORAGE = plain,
    DELIMITER = ','
);

CREATE OPERATOR < (
    PROCEDURE = app_user_id_lt,
    LEFTARG = app_user_id, 
    RIGHTARG = app_user_id,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel);

CREATE OPERATOR <= (
    PROCEDURE = app_user_id_lte,
    LEFTARG = app_user_id, 
    RIGHTARG = app_user_id,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel);

CREATE OPERATOR = (
    PROCEDURE = app_user_id_eq,
    LEFTARG = app_user_id, 
    RIGHTARG = app_user_id,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    HASHES, MERGES);

CREATE OPERATOR <> (
    PROCEDURE = app_user_id_neq,
    LEFTARG = app_user_id, 
    RIGHTARG = app_user_id,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel);

CREATE OPERATOR >= (
    PROCEDURE = app_user_id_gte, 
    LEFTARG = app_user_id, 
    RIGHTARG = app_user_id,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel);

CREATE OPERATOR > (
    PROCEDURE = app_user_id_gt, 
    LEFTARG = app_user_id, 
    RIGHTARG = app_user_id,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel);

CREATE OPERATOR CLASS btree_app_user_id_ops
    DEFAULT FOR TYPE app_user_id USING btree AS
        OPERATOR    1   <,
        OPERATOR    2   <=,
        OPERATOR    3   =,
        OPERATOR    4   >=,
        OPERATOR    5   >,
        FUNCTION    1   app_user_id_cmp (app_user_id, app_user_id);

CREATE OPERATOR CLASS hash_app_user_id_ops
    DEFAULT FOR TYPE app_user_id USING hash AS
        OPERATOR    1   =,
        FUNCTION    1   app_user_id_hash (app_user_id);
