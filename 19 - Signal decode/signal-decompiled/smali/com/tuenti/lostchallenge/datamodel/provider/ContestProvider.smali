.class public Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider;
.super Landroid/content/ContentProvider;
.source "ContestProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider$DatabaseHelper;
    }
.end annotation


# static fields
.field public static final AUTHORITY:Ljava/lang/String; = "com.tuenti.lostchallenge.datamodel.provider.ContestProvider"

.field private static final CONTEST:I = 0x1

.field private static final CONTEST_TABLE_NAME:Ljava/lang/String; = "contest"

.field private static final DATABASE_NAME:Ljava/lang/String; = "contest.db"

.field private static final DATABASE_VERSION:I = 0x1

.field private static final PRIVATEKEY:Ljava/lang/String; = "test"

.field private static final TAG:Ljava/lang/String; = "ContestProvider"

.field private static filmProjectionMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final sUriMatcher:Landroid/content/UriMatcher;


# instance fields
.field private dbHelper:Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider$DatabaseHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 224
    new-instance v0, Landroid/content/UriMatcher;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/content/UriMatcher;-><init>(I)V

    sput-object v0, Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider;->sUriMatcher:Landroid/content/UriMatcher;

    .line 225
    sget-object v0, Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.tuenti.lostchallenge.datamodel.provider.ContestProvider"

    const-string v2, "contest"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 227
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider;->filmProjectionMap:Ljava/util/HashMap;

    .line 228
    sget-object v0, Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider;->filmProjectionMap:Ljava/util/HashMap;

    const-string v1, "_id"

    const-string v2, "_id"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    sget-object v0, Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider;->filmProjectionMap:Ljava/util/HashMap;

    const-string v1, "key"

    const-string v2, "key"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    sget-object v0, Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider;->filmProjectionMap:Ljava/util/HashMap;

    const-string v1, "value"

    const-string v2, "value"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 5
    .parameter "uri"
    .parameter "where"
    .parameter "whereArgs"

    .prologue
    .line 74
    iget-object v2, p0, Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider;->dbHelper:Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider$DatabaseHelper;

    invoke-virtual {v2}, Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 76
    .local v1, db:Landroid/database/sqlite/SQLiteDatabase;
    sget-object v2, Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v2, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 82
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Unknown URI "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 78
    :pswitch_0
    const-string v2, "contest"

    invoke-virtual {v1, v2, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 85
    .local v0, count:I
    invoke-virtual {p0}, Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v3}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 86
    return v0

    .line 76
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 3
    .parameter "uri"

    .prologue
    .line 91
    sget-object v0, Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v0, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 96
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unknown URI "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 93
    :pswitch_0
    const-string v0, "vnd.android.cursor.dir/vnd.jwei512.contest"

    return-object v0

    .line 91
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 8
    .parameter "uri"
    .parameter "initialValues"

    .prologue
    .line 102
    sget-object v5, Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v5, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v5

    const/4 v6, 0x1

    if-eq v5, v6, :cond_0

    .line 103
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Unknown URI "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 107
    :cond_0
    if-eqz p2, :cond_1

    .line 108
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4, p2}, Landroid/content/ContentValues;-><init>(Landroid/content/ContentValues;)V

    .line 113
    .local v4, values:Landroid/content/ContentValues;
    :goto_0
    iget-object v5, p0, Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider;->dbHelper:Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider$DatabaseHelper;

    invoke-virtual {v5}, Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 114
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v5, "contest"

    const-string v6, "key"

    invoke-virtual {v0, v5, v6, v4}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v2

    .line 115
    .local v2, rowId:J
    const-wide/16 v5, 0x0

    cmp-long v5, v2, v5

    if-lez v5, :cond_2

    .line 116
    sget-object v5, Lcom/tuenti/lostchallenge/datamodel/provider/ContestBase;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v5, v2, v3}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    .line 118
    .local v1, noteUri:Landroid/net/Uri;
    invoke-virtual {p0}, Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v1, v6}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 119
    return-object v1

    .line 110
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v1           #noteUri:Landroid/net/Uri;
    .end local v2           #rowId:J
    .end local v4           #values:Landroid/content/ContentValues;
    :cond_1
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .restart local v4       #values:Landroid/content/ContentValues;
    goto :goto_0

    .line 122
    .restart local v0       #db:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v2       #rowId:J
    :cond_2
    new-instance v5, Landroid/database/SQLException;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Failed to insert row into "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/database/SQLException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method public onCreate()Z
    .locals 2

    .prologue
    .line 127
    new-instance v0, Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider$DatabaseHelper;

    invoke-virtual {p0}, Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider$DatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider;->dbHelper:Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider$DatabaseHelper;

    .line 128
    const/4 v0, 0x1

    return v0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 21
    .parameter "uri"
    .parameter "projection"
    .parameter "selection"
    .parameter "selectionArgs"
    .parameter "sortOrder"

    .prologue
    .line 134
    const/4 v6, 0x0

    check-cast v6, [Ljava/lang/String;

    .line 136
    .local v6, selectionCrypted:[Ljava/lang/String;
    if-nez p4, :cond_1

    .line 137
    const/4 v4, 0x0

    :try_start_0
    new-array v6, v4, [Ljava/lang/String;

    .line 141
    :goto_0
    const/16 v16, 0x0

    .local v16, i:I
    :goto_1
    array-length v4, v6

    move/from16 v0, v16

    if-lt v0, v4, :cond_2

    .line 149
    if-eqz p3, :cond_0

    if-eqz p3, :cond_3

    const-string v4, "key"

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 150
    :cond_0
    const/4 v4, 0x1

    new-array v13, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "value"

    aput-object v5, v13, v4

    .line 151
    .local v13, emptyCol:[Ljava/lang/String;
    const/4 v4, 0x1

    new-array v15, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "I need the key sorry guy"

    aput-object v5, v15, v4

    .line 153
    .local v15, emptyVal:[Ljava/lang/String;
    new-instance v14, Landroid/database/MatrixCursor;

    invoke-direct {v14, v13}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    .line 154
    .local v14, emptyMap:Landroid/database/MatrixCursor;
    invoke-virtual {v14, v15}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V

    move-object/from16 v17, v14

    .line 198
    .end local v13           #emptyCol:[Ljava/lang/String;
    .end local v14           #emptyMap:Landroid/database/MatrixCursor;
    .end local v15           #emptyVal:[Ljava/lang/String;
    :goto_2
    return-object v17

    .line 139
    .end local v16           #i:I
    :cond_1
    move-object/from16 v0, p4

    array-length v4, v0

    new-array v6, v4, [Ljava/lang/String;

    goto :goto_0

    .line 142
    .restart local v16       #i:I
    :cond_2
    new-instance v19, Lcom/tuenti/lostchallenge/encript/SimpleCrypto;

    const-string v4, "test"

    move-object/from16 v0, v19

    invoke-direct {v0, v4}, Lcom/tuenti/lostchallenge/encript/SimpleCrypto;-><init>(Ljava/lang/String;)V

    .line 144
    .local v19, simpleCrypto:Lcom/tuenti/lostchallenge/encript/SimpleCrypto;
    aget-object v4, p4, v16

    .line 143
    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Lcom/tuenti/lostchallenge/encript/SimpleCrypto;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v6, v16

    .line 141
    add-int/lit8 v16, v16, 0x1

    goto :goto_1

    .line 160
    .end local v19           #simpleCrypto:Lcom/tuenti/lostchallenge/encript/SimpleCrypto;
    :cond_3
    new-instance v2, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v2}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 162
    .local v2, qb:Landroid/database/sqlite/SQLiteQueryBuilder;
    sget-object v4, Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider;->sUriMatcher:Landroid/content/UriMatcher;

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v4

    packed-switch v4, :pswitch_data_0

    .line 169
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v7, "Unknown URI "

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p1

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 199
    .end local v2           #qb:Landroid/database/sqlite/SQLiteQueryBuilder;
    .end local v16           #i:I
    :catch_0
    move-exception v12

    .line 200
    .local v12, e:Ljava/lang/Exception;
    const-string v4, "error"

    const-string v5, "problem in query"

    invoke-static {v4, v5, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 202
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v7, "Unknown error "

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p1

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 164
    .end local v12           #e:Ljava/lang/Exception;
    .restart local v2       #qb:Landroid/database/sqlite/SQLiteQueryBuilder;
    .restart local v16       #i:I
    :pswitch_0
    :try_start_1
    const-string v4, "contest"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 165
    sget-object v4, Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider;->filmProjectionMap:Ljava/util/HashMap;

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 172
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider;->dbHelper:Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider$DatabaseHelper;

    invoke-virtual {v4}, Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider$DatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 174
    .local v3, db:Landroid/database/sqlite/SQLiteDatabase;
    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v9, p5

    .line 173
    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 176
    .local v10, c:Landroid/database/Cursor;
    invoke-interface {v10}, Landroid/database/Cursor;->getColumnNames()[Ljava/lang/String;

    move-result-object v11

    .line 177
    .local v11, columNames:[Ljava/lang/String;
    invoke-interface {v10}, Landroid/database/Cursor;->getColumnCount()I

    move-result v18

    .line 179
    .local v18, numColumn:I
    new-instance v17, Landroid/database/MatrixCursor;

    move-object/from16 v0, v17

    invoke-direct {v0, v11}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    .line 180
    .local v17, matrixCursor:Landroid/database/MatrixCursor;
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 182
    :cond_4
    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v20, v0

    .line 183
    .local v20, valuesDecrypted:[Ljava/lang/String;
    const/16 v16, 0x0

    :goto_3
    move/from16 v0, v16

    move/from16 v1, v18

    if-lt v0, v1, :cond_6

    .line 192
    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V

    .line 193
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    .line 181
    if-nez v4, :cond_4

    .line 196
    .end local v20           #valuesDecrypted:[Ljava/lang/String;
    :cond_5
    invoke-virtual/range {p0 .. p0}, Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v4, v1}, Landroid/database/MatrixCursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    goto/16 :goto_2

    .line 184
    .restart local v20       #valuesDecrypted:[Ljava/lang/String;
    :cond_6
    move/from16 v0, v16

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getType(I)I

    move-result v4

    const/4 v5, 0x3

    if-ne v4, v5, :cond_7

    .line 185
    new-instance v19, Lcom/tuenti/lostchallenge/encript/SimpleCrypto;

    const-string v4, "test"

    move-object/from16 v0, v19

    invoke-direct {v0, v4}, Lcom/tuenti/lostchallenge/encript/SimpleCrypto;-><init>(Ljava/lang/String;)V

    .line 187
    .restart local v19       #simpleCrypto:Lcom/tuenti/lostchallenge/encript/SimpleCrypto;
    move/from16 v0, v16

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 186
    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Lcom/tuenti/lostchallenge/encript/SimpleCrypto;->decrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v20, v16

    .line 183
    .end local v19           #simpleCrypto:Lcom/tuenti/lostchallenge/encript/SimpleCrypto;
    :goto_4
    add-int/lit8 v16, v16, 0x1

    goto :goto_3

    .line 189
    :cond_7
    move/from16 v0, v16

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v20, v16
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_4

    .line 162
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 5
    .parameter "uri"
    .parameter "values"
    .parameter "where"
    .parameter "whereArgs"

    .prologue
    .line 208
    iget-object v2, p0, Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider;->dbHelper:Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider$DatabaseHelper;

    invoke-virtual {v2}, Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 210
    .local v1, db:Landroid/database/sqlite/SQLiteDatabase;
    sget-object v2, Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v2, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 216
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Unknown URI "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 212
    :pswitch_0
    const-string v2, "contest"

    invoke-virtual {v1, v2, p2, p3, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 219
    .local v0, count:I
    invoke-virtual {p0}, Lcom/tuenti/lostchallenge/datamodel/provider/ContestProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v3}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 220
    return v0

    .line 210
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
