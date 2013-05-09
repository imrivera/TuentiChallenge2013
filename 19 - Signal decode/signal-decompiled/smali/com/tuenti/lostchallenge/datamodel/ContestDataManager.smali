.class public Lcom/tuenti/lostchallenge/datamodel/ContestDataManager;
.super Ljava/lang/Object;
.source "ContestDataManager.java"


# static fields
.field private static final LOGTAG:Ljava/lang/String; = "ContestDataManager"

.field private static instance:Lcom/tuenti/lostchallenge/datamodel/ContestDataManager;


# instance fields
.field private mContent:Landroid/content/ContentResolver;

.field private mInit:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 39
    new-instance v0, Lcom/tuenti/lostchallenge/datamodel/ContestDataManager;

    invoke-direct {v0}, Lcom/tuenti/lostchallenge/datamodel/ContestDataManager;-><init>()V

    sput-object v0, Lcom/tuenti/lostchallenge/datamodel/ContestDataManager;->instance:Lcom/tuenti/lostchallenge/datamodel/ContestDataManager;

    .line 36
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/tuenti/lostchallenge/datamodel/ContestDataManager;->mInit:Z

    .line 46
    return-void
.end method

.method public static Init(Landroid/content/ContentResolver;)V
    .locals 2
    .parameter "content"

    .prologue
    .line 49
    sget-object v0, Lcom/tuenti/lostchallenge/datamodel/ContestDataManager;->instance:Lcom/tuenti/lostchallenge/datamodel/ContestDataManager;

    iget-boolean v0, v0, Lcom/tuenti/lostchallenge/datamodel/ContestDataManager;->mInit:Z

    if-nez v0, :cond_0

    .line 50
    sget-object v0, Lcom/tuenti/lostchallenge/datamodel/ContestDataManager;->instance:Lcom/tuenti/lostchallenge/datamodel/ContestDataManager;

    iput-object p0, v0, Lcom/tuenti/lostchallenge/datamodel/ContestDataManager;->mContent:Landroid/content/ContentResolver;

    .line 51
    sget-object v0, Lcom/tuenti/lostchallenge/datamodel/ContestDataManager;->instance:Lcom/tuenti/lostchallenge/datamodel/ContestDataManager;

    invoke-direct {v0}, Lcom/tuenti/lostchallenge/datamodel/ContestDataManager;->populateAllData()V

    .line 52
    sget-object v0, Lcom/tuenti/lostchallenge/datamodel/ContestDataManager;->instance:Lcom/tuenti/lostchallenge/datamodel/ContestDataManager;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/tuenti/lostchallenge/datamodel/ContestDataManager;->mInit:Z

    .line 55
    :cond_0
    return-void
.end method

.method private addRow(Lcom/tuenti/lostchallenge/datamodel/ContestValue;)V
    .locals 7
    .parameter "row"

    .prologue
    .line 80
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 81
    .local v0, values:Landroid/content/ContentValues;
    const-string v1, "key"

    invoke-virtual {p1}, Lcom/tuenti/lostchallenge/datamodel/ContestValue;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    const-string v1, "value"

    invoke-virtual {p1}, Lcom/tuenti/lostchallenge/datamodel/ContestValue;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    iget-object v1, p0, Lcom/tuenti/lostchallenge/datamodel/ContestDataManager;->mContent:Landroid/content/ContentResolver;

    sget-object v2, Lcom/tuenti/lostchallenge/datamodel/provider/ContestBase;->CONTENT_URI:Landroid/net/Uri;

    const-string v3, "key=?"

    .line 85
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual {p1}, Lcom/tuenti/lostchallenge/datamodel/ContestValue;->getKey()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    .line 84
    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_0

    .line 86
    iget-object v1, p0, Lcom/tuenti/lostchallenge/datamodel/ContestDataManager;->mContent:Landroid/content/ContentResolver;

    sget-object v2, Lcom/tuenti/lostchallenge/datamodel/provider/ContestBase;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v1, v2, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 89
    :cond_0
    return-void
.end method

.method public static isInit()Z
    .locals 1

    .prologue
    .line 92
    sget-object v0, Lcom/tuenti/lostchallenge/datamodel/ContestDataManager;->instance:Lcom/tuenti/lostchallenge/datamodel/ContestDataManager;

    iget-boolean v0, v0, Lcom/tuenti/lostchallenge/datamodel/ContestDataManager;->mInit:Z

    return v0
.end method

.method private populateAllData()V
    .locals 9

    .prologue
    .line 59
    :try_start_0
    new-instance v3, Ldatanative/tuenti/lostchallenge/DataNative;

    invoke-direct {v3}, Ldatanative/tuenti/lostchallenge/DataNative;-><init>()V

    .line 60
    .local v3, objNative:Ldatanative/tuenti/lostchallenge/DataNative;
    invoke-virtual {v3}, Ldatanative/tuenti/lostchallenge/DataNative;->getKeys()[Ljava/lang/String;

    move-result-object v2

    .line 61
    .local v2, keys:[Ljava/lang/String;
    invoke-virtual {v3}, Ldatanative/tuenti/lostchallenge/DataNative;->getValues()[Ljava/lang/String;

    move-result-object v6

    .line 63
    .local v6, values:[Ljava/lang/String;
    new-instance v4, Lcom/tuenti/lostchallenge/encript/SimpleCrypto;

    const-string v7, "test"

    invoke-direct {v4, v7}, Lcom/tuenti/lostchallenge/encript/SimpleCrypto;-><init>(Ljava/lang/String;)V

    .line 65
    .local v4, simpleCrypto:Lcom/tuenti/lostchallenge/encript/SimpleCrypto;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v7, v2

    if-lt v1, v7, :cond_0

    .line 74
    .end local v1           #i:I
    .end local v2           #keys:[Ljava/lang/String;
    .end local v3           #objNative:Ldatanative/tuenti/lostchallenge/DataNative;
    .end local v4           #simpleCrypto:Lcom/tuenti/lostchallenge/encript/SimpleCrypto;
    .end local v6           #values:[Ljava/lang/String;
    :goto_1
    return-void

    .line 66
    .restart local v1       #i:I
    .restart local v2       #keys:[Ljava/lang/String;
    .restart local v3       #objNative:Ldatanative/tuenti/lostchallenge/DataNative;
    .restart local v4       #simpleCrypto:Lcom/tuenti/lostchallenge/encript/SimpleCrypto;
    .restart local v6       #values:[Ljava/lang/String;
    :cond_0
    new-instance v5, Lcom/tuenti/lostchallenge/datamodel/ContestValue;

    invoke-direct {v5}, Lcom/tuenti/lostchallenge/datamodel/ContestValue;-><init>()V

    .line 67
    .local v5, value:Lcom/tuenti/lostchallenge/datamodel/ContestValue;
    aget-object v7, v2, v1

    invoke-virtual {v4, v7}, Lcom/tuenti/lostchallenge/encript/SimpleCrypto;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Lcom/tuenti/lostchallenge/datamodel/ContestValue;->setKey(Ljava/lang/String;)V

    .line 68
    aget-object v7, v6, v1

    invoke-virtual {v4, v7}, Lcom/tuenti/lostchallenge/encript/SimpleCrypto;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Lcom/tuenti/lostchallenge/datamodel/ContestValue;->setValue(Ljava/lang/String;)V

    .line 69
    invoke-direct {p0, v5}, Lcom/tuenti/lostchallenge/datamodel/ContestDataManager;->addRow(Lcom/tuenti/lostchallenge/datamodel/ContestValue;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 71
    .end local v1           #i:I
    .end local v2           #keys:[Ljava/lang/String;
    .end local v3           #objNative:Ldatanative/tuenti/lostchallenge/DataNative;
    .end local v4           #simpleCrypto:Lcom/tuenti/lostchallenge/encript/SimpleCrypto;
    .end local v5           #value:Lcom/tuenti/lostchallenge/datamodel/ContestValue;
    .end local v6           #values:[Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 72
    .local v0, e:Ljava/lang/Exception;
    const-string v7, "ContestDataManager"

    const-string v8, "error populating"

    invoke-static {v7, v8, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method
