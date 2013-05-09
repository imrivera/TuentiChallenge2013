.class public final Lcom/tuenti/lostchallenge/datamodel/provider/ContestBase;
.super Ljava/lang/Object;
.source "ContestBase.java"

# interfaces
.implements Landroid/provider/BaseColumns;


# static fields
.field public static final CONTENT_TYPE:Ljava/lang/String; = "vnd.android.cursor.dir/vnd.jwei512.contest"

.field public static final CONTENT_URI:Landroid/net/Uri; = null

.field public static final CONTEST_ID:Ljava/lang/String; = "_id"

.field public static final KEY:Ljava/lang/String; = "key"

.field public static final VALUE:Ljava/lang/String; = "value"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 10
    const-string v0, "content://com.tuenti.lostchallenge.datamodel.provider.ContestProvider/contest"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/tuenti/lostchallenge/datamodel/provider/ContestBase;->CONTENT_URI:Landroid/net/Uri;

    .line 6
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    return-void
.end method
