#ifndef _SNAPSHOT_H_
#define _SNAPSHOT_H_

#define SNAPSHOT_MAGIC			"#!s9xsnp"
#define SNAPSHOT_VERSION		7

#define SUCCESS					1
#define WRONG_FORMAT			(-1)
#define WRONG_VERSION			(-2)
#define FILE_NOT_FOUND			(-3)
#define WRONG_MOVIE_SNAPSHOT	(-4)
#define NOT_A_MOVIE_SNAPSHOT	(-5)
#define SNAPSHOT_INCONSISTENT	(-6)

void S9xResetSaveTimer (bool8);
bool8 S9xFreezeGame (const char *);
uint32 S9xFreezeSize (void);
bool8 S9xFreezeGameMem (uint8 *,uint32);
bool8 S9xUnfreezeGame (const char *);
int S9xUnfreezeGameMem (const uint8 *,uint32);
void S9xFreezeToStream (STREAM);
int S9xUnfreezeFromStream (STREAM);
bool8 S9xSPCDump (const char *);

#endif
