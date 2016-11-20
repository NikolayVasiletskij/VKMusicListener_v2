-----------------------------------------CREATING TABLE-----------------------------------

-----------------------------------------USERS--------------------------------------------
 CREATE TABLE "ADMIN"."USERS" 
  (	"USER_ID" NUMBER NOT NULL ENABLE, 
"NAME" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
"VK_ID" VARCHAR2(45 BYTE) NOT NULL ENABLE, 
"REGISTRATION" DATE NOT NULL ENABLE, 
"ACCESS_TOKEN" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
 PRIMARY KEY ("USER_ID")
 USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
 STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
 TABLESPACE "USERS"  ENABLE
  ) SEGMENT CREATION IMMEDIATE 
 PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
NOCOMPRESS LOGGING
 STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
 TABLESPACE "USERS" ;
 ----------------------------------------MUSIC--------------------------------------------
 CREATE TABLE "ADMIN"."MUSIC" 
  (	"MUSIC_ID" NUMBER(*,0), 
"AUTHOR" VARCHAR2(20 BYTE), 
"NAME" VARCHAR2(20 BYTE), 
"SONG" BLOB, 
 PRIMARY KEY ("MUSIC_ID")
 USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
 TABLESPACE "USERS"  ENABLE
  ) SEGMENT CREATION DEFERRED 
 PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
NOCOMPRESS LOGGING
 TABLESPACE "USERS" 
LOB ("SONG") STORE AS SECUREFILE (
 TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
 NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
 -----------------------------------------ROOM---------------------------------------------
 CREATE TABLE "ADMIN"."ROOMS" 
  (	"ROOM_ID" NUMBER NOT NULL ENABLE, 
"NAME" VARCHAR2(45 BYTE) NOT NULL ENABLE, 
"DESCRIPTION" VARCHAR2(100 BYTE), 
"CREATED" DATE NOT NULL ENABLE, 
 CONSTRAINT "ROOM_PK" PRIMARY KEY ("ROOM_ID")
 USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
 TABLESPACE "USERS"  ENABLE
  ) SEGMENT CREATION DEFERRED 
 PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
NOCOMPRESS LOGGING
 TABLESPACE "USERS" ;
 ----------------------------------------PLAYLIST-------------------------------------------
 CREATE TABLE "ADMIN"."PLAYLIST" 
  (	"PLAYLIST_ID" NUMBER NOT NULL ENABLE, 
"ROOM_ID" NUMBER NOT NULL ENABLE, 
"MUSIC_ID" NUMBER, 
"ADDED_DATE" DATE NOT NULL ENABLE, 
 CONSTRAINT "PK_PLAYLIST" PRIMARY KEY ("PLAYLIST_ID")
 USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
 TABLESPACE "USERS"  ENABLE, 
 CONSTRAINT "FK_ROOM" FOREIGN KEY ("ROOM_ID")
  REFERENCES "ADMIN"."ROOMS" ("ROOM_ID") ENABLE, 
 CONSTRAINT "FK_MUSIC" FOREIGN KEY ("MUSIC_ID")
  REFERENCES "ADMIN"."MUSIC" ("MUSIC_ID") ENABLE
  ) SEGMENT CREATION DEFERRED 
 PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
NOCOMPRESS LOGGING
 TABLESPACE "USERS" ;
 -----------------------------------------USER_PLAYLIST---------------------------------------
 CREATE TABLE "ADMIN"."USER_PLAYLIST" 
  (	"USER_ID" NUMBER NOT NULL ENABLE, 
"PLAYLIST_ID" NUMBER NOT NULL ENABLE, 
"ISCREATORROOM" NUMBER(3,0), 
"UP_ID" NUMBER NOT NULL ENABLE, 
 CONSTRAINT "USER_PLAYLIST_PK" PRIMARY KEY ("UP_ID")
 USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
 TABLESPACE "USERS"  ENABLE, 
 FOREIGN KEY ("USER_ID")
  REFERENCES "ADMIN"."USERS" ("USER_ID") ENABLE, 
 FOREIGN KEY ("PLAYLIST_ID")
  REFERENCES "ADMIN"."PLAYLIST" ("PLAYLIST_ID") ENABLE
  ) SEGMENT CREATION DEFERRED 
 PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
NOCOMPRESS LOGGING
 TABLESPACE "USERS" ;
 