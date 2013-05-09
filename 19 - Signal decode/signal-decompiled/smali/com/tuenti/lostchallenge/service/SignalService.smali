.class public Lcom/tuenti/lostchallenge/service/SignalService;
.super Landroid/app/Service;
.source "SignalService.java"


# static fields
.field public static final ACTION_SEND_DATA:Ljava/lang/String; = "com.tuenti.signal"

.field public static final CHANNEL:Ljava/lang/String; = "channel"

.field private static final DATA_INFO:Ljava/lang/String; = "SIGNAL_INFO"

.field private static final NUM_PARTS:I = 0x5

.field private static final TIME_INTERVAL_SIGNAL:J = 0x1388L

.field public static isConected:Z


# instance fields
.field private handler:Landroid/os/Handler;

.field private imageArray:[B

.field private position:I

.field sender:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 40
    const/4 v0, 0x0

    sput-boolean v0, Lcom/tuenti/lostchallenge/service/SignalService;->isConected:Z

    .line 24
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 42
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 37
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/tuenti/lostchallenge/service/SignalService;->imageArray:[B

    .line 38
    const/4 v0, 0x0

    iput v0, p0, Lcom/tuenti/lostchallenge/service/SignalService;->position:I

    .line 120
    new-instance v0, Lcom/tuenti/lostchallenge/service/SignalService$1;

    invoke-direct {v0, p0}, Lcom/tuenti/lostchallenge/service/SignalService$1;-><init>(Lcom/tuenti/lostchallenge/service/SignalService;)V

    iput-object v0, p0, Lcom/tuenti/lostchallenge/service/SignalService;->sender:Ljava/lang/Runnable;

    .line 44
    return-void
.end method

.method static synthetic access$0(Lcom/tuenti/lostchallenge/service/SignalService;)V
    .locals 0
    .parameter

    .prologue
    .line 133
    invoke-direct {p0}, Lcom/tuenti/lostchallenge/service/SignalService;->sendData()V

    return-void
.end method

.method static synthetic access$1(Lcom/tuenti/lostchallenge/service/SignalService;)Landroid/os/Handler;
    .locals 1
    .parameter

    .prologue
    .line 35
    iget-object v0, p0, Lcom/tuenti/lostchallenge/service/SignalService;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method private convertString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 89
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 91
    .local v0, buffer:Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v2, p0, Lcom/tuenti/lostchallenge/service/SignalService;->imageArray:[B

    array-length v2, v2

    if-lt v1, v2, :cond_0

    .line 95
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 92
    :cond_0
    iget-object v2, p0, Lcom/tuenti/lostchallenge/service/SignalService;->imageArray:[B

    aget-byte v2, v2, v1

    int-to-char v2, v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 91
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private initDataImage(Ljava/lang/String;)V
    .locals 12
    .parameter "key"

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x0

    .line 54
    invoke-virtual {p0}, Lcom/tuenti/lostchallenge/service/SignalService;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f020002

    invoke-static {v7, v8}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 56
    .local v2, bitmapRes:Landroid/graphics/Bitmap;
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    sget-object v9, Landroid/graphics/Bitmap$Config;->ARGB_4444:Landroid/graphics/Bitmap$Config;

    invoke-static {v7, v8, v9}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 57
    .local v1, bitmapKey:Landroid/graphics/Bitmap;
    new-instance v3, Landroid/graphics/Canvas;

    invoke-direct {v3, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 58
    .local v3, canvas:Landroid/graphics/Canvas;
    const/4 v7, 0x0

    invoke-virtual {v3, v2, v10, v10, v7}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 60
    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    .line 61
    .local v4, paint:Landroid/graphics/Paint;
    const/high16 v7, -0x100

    invoke-virtual {v4, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 62
    sget-object v7, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 64
    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    .line 65
    .local v6, textBounds:Landroid/graphics/Rect;
    const/high16 v7, 0x4348

    invoke-virtual {v4, v7}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 66
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v4, p1, v11, v7, v6}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 68
    new-instance v5, Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    add-int/lit8 v7, v7, -0xf

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v8

    sub-int/2addr v7, v8

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    .line 69
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    add-int/lit8 v9, v9, -0xa

    .line 68
    invoke-direct {v5, v11, v7, v8, v9}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 70
    .local v5, rect:Landroid/graphics/Rect;
    invoke-virtual {v3, v5, v4}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 72
    const/4 v7, -0x1

    invoke-virtual {v4, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 73
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v8

    sub-int/2addr v7, v8

    div-int/lit8 v7, v7, 0x2

    int-to-float v7, v7

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    add-int/lit8 v8, v8, -0xf

    int-to-float v8, v8

    invoke-virtual {v3, p1, v7, v8, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 75
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 76
    .local v0, baos:Ljava/io/ByteArrayOutputStream;
    sget-object v7, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v8, 0x55

    invoke-virtual {v1, v7, v8, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 77
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v7

    iput-object v7, p0, Lcom/tuenti/lostchallenge/service/SignalService;->imageArray:[B

    .line 86
    return-void
.end method

.method private sendData()V
    .locals 6

    .prologue
    .line 134
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 135
    .local v1, intent:Landroid/content/Intent;
    const-string v2, "com.tuenti.signal"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 138
    iget v2, p0, Lcom/tuenti/lostchallenge/service/SignalService;->position:I

    const/4 v3, 0x4

    if-ge v2, v3, :cond_0

    .line 139
    iget-object v2, p0, Lcom/tuenti/lostchallenge/service/SignalService;->imageArray:[B

    array-length v2, v2

    div-int/lit8 v2, v2, 0x5

    new-array v0, v2, [B

    .line 143
    .local v0, array:[B
    :goto_0
    iget-object v2, p0, Lcom/tuenti/lostchallenge/service/SignalService;->imageArray:[B

    iget v3, p0, Lcom/tuenti/lostchallenge/service/SignalService;->position:I

    iget-object v4, p0, Lcom/tuenti/lostchallenge/service/SignalService;->imageArray:[B

    array-length v4, v4

    div-int/lit8 v4, v4, 0x5

    mul-int/2addr v3, v4

    const/4 v4, 0x0

    array-length v5, v0

    invoke-static {v2, v3, v0, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 144
    const-string v2, "SIGNAL_INFO"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 145
    const-string v2, "service"

    const-string v3, "sending broadcast"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    invoke-virtual {p0, v1}, Lcom/tuenti/lostchallenge/service/SignalService;->sendBroadcast(Landroid/content/Intent;)V

    .line 148
    iget v2, p0, Lcom/tuenti/lostchallenge/service/SignalService;->position:I

    add-int/lit8 v2, v2, 0x1

    rem-int/lit8 v2, v2, 0x5

    iput v2, p0, Lcom/tuenti/lostchallenge/service/SignalService;->position:I

    .line 149
    return-void

    .line 141
    .end local v0           #array:[B
    :cond_0
    iget-object v2, p0, Lcom/tuenti/lostchallenge/service/SignalService;->imageArray:[B

    array-length v2, v2

    iget v3, p0, Lcom/tuenti/lostchallenge/service/SignalService;->position:I

    iget-object v4, p0, Lcom/tuenti/lostchallenge/service/SignalService;->imageArray:[B

    array-length v4, v4

    div-int/lit8 v4, v4, 0x5

    mul-int/2addr v3, v4

    sub-int/2addr v2, v3

    new-array v0, v2, [B

    .restart local v0       #array:[B
    goto :goto_0
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 2
    .parameter "intent"

    .prologue
    .line 154
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not bind"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public onCreate()V
    .locals 1

    .prologue
    .line 48
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 49
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/tuenti/lostchallenge/service/SignalService;->handler:Landroid/os/Handler;

    .line 50
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 7
    .parameter "intent"
    .parameter "flags"
    .parameter "startId"

    .prologue
    const/4 v5, -0x1

    .line 100
    const-string v3, "service"

    const-string v4, "start service"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    const-string v3, "channel"

    invoke-virtual {p1, v3, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 103
    .local v0, channel:I
    if-eq v0, v5, :cond_0

    .line 104
    new-instance v1, Ldatanative/tuenti/lostchallenge/DataNative;

    invoke-direct {v1}, Ldatanative/tuenti/lostchallenge/DataNative;-><init>()V

    .line 105
    .local v1, dataNative:Ldatanative/tuenti/lostchallenge/DataNative;
    invoke-virtual {v1, v0}, Ldatanative/tuenti/lostchallenge/DataNative;->getKey(I)Ljava/lang/String;

    move-result-object v2

    .line 106
    .local v2, key:Ljava/lang/String;
    const-string v3, "borrar"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "from native "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    invoke-direct {p0, v2}, Lcom/tuenti/lostchallenge/service/SignalService;->initDataImage(Ljava/lang/String;)V

    .line 109
    invoke-virtual {p0}, Lcom/tuenti/lostchallenge/service/SignalService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-static {v3}, Lcom/tuenti/lostchallenge/datamodel/ContestDataManager;->Init(Landroid/content/ContentResolver;)V

    .line 110
    const/4 v3, 0x1

    sput-boolean v3, Lcom/tuenti/lostchallenge/service/SignalService;->isConected:Z

    .line 113
    .end local v1           #dataNative:Ldatanative/tuenti/lostchallenge/DataNative;
    .end local v2           #key:Ljava/lang/String;
    :cond_0
    invoke-direct {p0}, Lcom/tuenti/lostchallenge/service/SignalService;->sendData()V

    .line 114
    iget-object v3, p0, Lcom/tuenti/lostchallenge/service/SignalService;->handler:Landroid/os/Handler;

    iget-object v4, p0, Lcom/tuenti/lostchallenge/service/SignalService;->sender:Ljava/lang/Runnable;

    const-wide/16 v5, 0x1388

    invoke-virtual {v3, v4, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 116
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result v3

    return v3
.end method
