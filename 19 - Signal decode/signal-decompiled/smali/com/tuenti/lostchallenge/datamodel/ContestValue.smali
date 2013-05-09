.class public Lcom/tuenti/lostchallenge/datamodel/ContestValue;
.super Ljava/lang/Object;
.source "ContestValue.java"


# instance fields
.field private key:Ljava/lang/String;

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    const-string v0, ""

    iput-object v0, p0, Lcom/tuenti/lostchallenge/datamodel/ContestValue;->value:Ljava/lang/String;

    .line 9
    const-string v0, ""

    iput-object v0, p0, Lcom/tuenti/lostchallenge/datamodel/ContestValue;->key:Ljava/lang/String;

    .line 6
    return-void
.end method


# virtual methods
.method public getKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lcom/tuenti/lostchallenge/datamodel/ContestValue;->key:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 12
    iget-object v0, p0, Lcom/tuenti/lostchallenge/datamodel/ContestValue;->value:Ljava/lang/String;

    return-object v0
.end method

.method public setKey(Ljava/lang/String;)V
    .locals 0
    .parameter "key"

    .prologue
    .line 21
    iput-object p1, p0, Lcom/tuenti/lostchallenge/datamodel/ContestValue;->key:Ljava/lang/String;

    .line 22
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .parameter "value"

    .prologue
    .line 15
    iput-object p1, p0, Lcom/tuenti/lostchallenge/datamodel/ContestValue;->value:Ljava/lang/String;

    .line 16
    return-void
.end method
