.class public Ldatanative/tuenti/lostchallenge/DataNative;
.super Ljava/lang/Object;
.source "DataNative.java"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 5
    const-string v0, "keys"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 3
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public native getKey(I)Ljava/lang/String;
.end method

.method public native getKeys()[Ljava/lang/String;
.end method

.method public native getValues()[Ljava/lang/String;
.end method
