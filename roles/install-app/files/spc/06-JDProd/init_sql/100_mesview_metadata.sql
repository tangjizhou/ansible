--** The script is dumped by *ZSQL;EXP* tool, Zenith@Huawei Gauss Dept.
--** Dumped time: 2021-09-09 10:28:14.886

-- EXPORT TYPE = SCHEMA
-- EXPORT OBJECTS = MESVIEW
-- FILE TYPE = TXT
-- DUMP FILE = ;home;omm;mesview.dmp
-- LOG FILE = 
-- QUERY = ""
-- COMPRESS = N
-- CONSISTENT = N
-- CONTENT_MODE = METADATA_ONLY
-- SKIP_COMMENTS = N
-- FORCE = N
-- SKIP_ADD_DROP_TABLE = N
-- SKIP_TRIGGERS = N
-- QUOTE_NAMES = Y
-- TABLESPACE = N
-- COMMIT_BATCH = 1000
-- INSERT_BATCH = 1
-- FEEDBACK = 10000
-- PARALLEL = 4
-- TENANT = N
-- CREATE_USER = N
-- ROLE = N
-- GRANT = N
-- WITH_CR_MODE = N
-- WITH_FORMAT_CSF = Y

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT = 'YYYY-MM-DD HH24:MI:SS.FF';
ALTER SESSION SET NLS_TIMESTAMP_TZ_FORMAT = 'YYYY-MM-DD HH24:MI:SS.FF TZH:TZM';
ALTER SESSION SET NLS_TIME_FORMAT = 'HH:MI:SS.FF AM';
ALTER SESSION SET NLS_TIME_TZ_FORMAT = 'HH:MI:SS.FF AM TZR';


ALTER SESSION SET CURRENT_SCHEMA = MESVIEW;
CREATE OR REPLACE FORCE VIEW "EDCAPRSTPARM"
(
  "FACTORY",
  "EDC_PLAN",
  "EDC_PLAN_VER",
  "MEASSPEC",
  "SEQ_NUM",
  "UNIT_COUNT",
  "SITE_COUNT",
  "TARGET_VALUE",
  "UPPER_SPEC_LIMIT",
  "LOWER_SPEC_LIMIT",
  "UPPER_WARN_LIMIT",
  "LOWER_WARN_LIMIT",
  "DERIVED_PARAM_YN",
  "DERIVED_PARAM"
) AS
(

SELECT FACTORY,
       PARAM_SET_ID AS EDC_PLAN,
       PARAM_SET_VER EDC_PLAN_VER,
       PARAM_ID AS MEASSPEC,
       SEQ_NUM,
       UNIT_COUNT,
       VALUE_COUNT AS SITE_COUNT,
       TARGET_VALUE,
       UPPER_SPEC_LIMIT,
       LOWER_SPEC_LIMIT,
       UPPER_WARN_LIMIT,
       LOWER_WARN_LIMIT,
       DERIVED_PARAM_YN,
       DERIVED_PARAM
  FROM MESMGR.EDCAPRSTPARM
  )
;

CREATE OR REPLACE FORCE VIEW "ETCMEQPGDFNT"
(
  "FACTORY",
  "CAPABILITY",
  "CAPABILITY_DESC"
) AS
(
SELECT  
FACTORY ,
EQUIP_GRP_ID AS CAPABILITY,
EQUIP_GRP_DESC AS CAPABILITY_DESC
FROM MESMGR.ETCMEQPGDFNT

  )
;

CREATE OR REPLACE FORCE VIEW "ETCMEQPGEQPT"
(
  "FACTORY",
  "CAPABILITY",
  "EQUIP_ID"
) AS
(
SELECT 
FACTORY ,
EQUIP_GRP_ID AS CAPABILITY,
EQUIP_ID 
FROM 
MESMGR.ETCMEQPGEQPT

  )
;

CREATE OR REPLACE FORCE VIEW "ETCMEQPTMAST"
(
  "FACTORY",
  "EQUIP_ID",
  "EQUIP_DESC"
) AS
(
SELECT 
FACTORY ,
EQUIP_ID ,
EQUIP_DESC 
FROM 
MESMGR.ETCMEQPTMAST

  )
;

CREATE OR REPLACE FORCE VIEW "ETCMSEQPMAST"
(
  "FACTORY",
  "EQUIP_ID",
  "SUB_EQUIP_ID",
  "SUB_EQUIP_DESC"
) AS
(
SELECT 
FACTORY ,
EQUIP_ID ,
SUB_EQUIP_ID ,
SUB_EQUIP_DESC 
FROM MESMGR.ETCMSEQPMAST

  )
;

CREATE OR REPLACE FORCE VIEW "PRCMPROCDFNT"
(
  "FACTORY",
  "OCAP_TYPE",
  "OCAP_ID",
  "OCAP_DESC"
) AS
(
SELECT FACTORY,
       WORK_PROC_TYPE AS OCAP_TYPE,
       PROC_ID AS OCAP_ID,
       PROC_DESC AS OCAP_DESC
  FROM MESMGR.PRCMPROCDFNT
 
  )
;

CREATE OR REPLACE FORCE VIEW "WIPMFHGDDFNT"
(
  "FACTORY",
  "PRODUCT",
  "PRODUCT_VER",
  "PRODUCT_DESC",
  "PRODUCT_TYPE",
  "TOPPLAN",
  "TOPPLAN_VER",
  "APPROVAL_YN",
  "RELEASE_YN",
  "DEACTIVE_YN",
  "DELETE_YN"
) AS
(
SELECT 
T.FACTORY,
T.FINISH_GOOD_ID AS PRODUCT,
T.FINISH_GOOD_VER AS PRODUCT_VER,
T.FINISH_GOOD_DESC AS PRODUCT_DESC,
T.FINISH_GOOD_TYPE AS PRODUCT_TYPE,
T.PRODUCT_ID AS TOPPLAN,
T.PRODUCT_VER AS TOPPLAN_VER,
T.APPROVAL_YN,
T.RELEASE_YN,
T.DEACTIVE_YN,
T.DELETE_YN
FROM MESMGR.WIPMFHGDDFNT T

  )
;

CREATE OR REPLACE FORCE VIEW "WIPMFHGDPROD_C"
(
  "FACTORY",
  "PRODUCT",
  "PRODUCT_VER",
  "TOPPLAN",
  "TOPPLAN_VER"
) AS
(
SELECT 
FACTORY,
FINISH_GOOD_ID AS PRODUCT,
FINISH_GOOD_VER AS PRODUCT_VER,
PRODUCT_ID AS TOPPLAN,
PRODUCT_VER AS TOPPLAN_VER
FROM MESMGR.WIPMFHGDPROD_C

  )
;

CREATE OR REPLACE FORCE VIEW "WIPMOPERDFNT"
(
  "STEP",
  "STEP_DESC",
  "CAPABILITY"
) AS
(
SELECT 
OPER AS STEP,
OPER_DESC AS STEP_DESC,
EQUIP_GRP_ID AS CAPABILITY
FROM 
MESMGR.WIPMOPERDFNT

  )
;

CREATE OR REPLACE FORCE VIEW "WIPMPRODDFNT"
(
  "FACTORY",
  "TOPPLAN",
  "TOPPLAN_VER",
  "TOPPLAN_SHORT_DESC",
  "TOPPLAN_DESC",
  "TOPPLAN_TYPE",
  "FIRST_PLAN",
  "FIRST_PLAN_VER",
  "LAST_PLAN",
  "LAST_PLAN_VER",
  "APPROVAL_YN",
  "RELEASE_YN",
  "DEACTIVE_YN",
  "DELETE_YN"
) AS
(
SELECT 
T.FACTORY,
T.PRODUCT_ID AS TOPPLAN,
T.PRODUCT_VER AS TOPPLAN_VER,
T.PRODUCT_SHORT_DESC AS TOPPLAN_SHORT_DESC,
T.PRODUCT_DESC AS TOPPLAN_DESC,
T.PRODUCT_TYPE AS TOPPLAN_TYPE,
T.FIRST_ROUTE AS FIRST_PLAN,
T.FIRST_ROUTE_VER AS FIRST_PLAN_VER,
T.LAST_ROUTE AS LAST_PLAN,
T.LAST_ROUTE_VER AS LAST_PLAN_VER,
T.APPROVAL_YN,
T.RELEASE_YN,
T.DEACTIVE_YN,
T.DELETE_YN
FROM MESMGR.WIPMPRODDFNT T

  )
;

CREATE OR REPLACE FORCE VIEW "WIPMPRODROUT"
(
  "FACTORY",
  "TOPPLAN",
  "TOPPLAN_VER",
  "PLAN",
  "PLAN_VER",
  "PLAN_SEQ_NUM"
) AS
(

SELECT  
FACTORY,
PRODUCT_ID AS TOPPLAN,
PRODUCT_VER AS TOPPLAN_VER,
ROUTE AS PLAN,
ROUTE_VER AS PLAN_VER,
ROUTE_SEQ_NUM AS PLAN_SEQ_NUM
FROM MESMGR.WIPMPRODROUT
 
  )
;

CREATE OR REPLACE FORCE VIEW "WIPMROUTDFNT"
(
  "PLAN",
  "PLAN_DESC",
  "PLAN_VER",
  "FIRST_STEP",
  "LAST_STEP",
  "APPROVAL_YN",
  "RELEASE_YN",
  "DEACTIVE_YN",
  "DELETE_YN"
) AS
(

SELECT 
ROUTE AS PLAN,
ROUTE_DESC AS PLAN_DESC,
ROUTE_VER AS PLAN_VER,
FIRST_OPER AS FIRST_STEP,
LAST_OPER AS LAST_STEP,
APPROVAL_YN,
RELEASE_YN,
DEACTIVE_YN,
DELETE_YN
FROM  MESMGR.WIPMROUTDFNT
 
  )
;

CREATE OR REPLACE FORCE VIEW "WIPMROUTOPER"
(
  "FACTORY",
  "PLAN",
  "PLAN_VER",
  "STEP",
  "STEP_SEQ_NUM"
) AS
(
SELECT 
FACTORY ,
ROUTE AS PLAN,
ROUTE_VER AS PLAN_VER,
OPER AS STEP,
SEQ_NUM AS STEP_SEQ_NUM
FROM MESMGR.WIPMROUTOPER

  )
;

-- end of exp: 2021-09-09 10:28:14.955