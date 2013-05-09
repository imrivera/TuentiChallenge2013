.class Lcom/tuenti/lostchallenge/service/SignalService$1;
.super Ljava/lang/Object;
.source "SignalService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tuenti/lostchallenge/service/SignalService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tuenti/lostchallenge/service/SignalService;


# direct methods
.method constructor <init>(Lcom/tuenti/lostchallenge/service/SignalService;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/tuenti/lostchallenge/service/SignalService$1;->this$0:Lcom/tuenti/lostchallenge/service/SignalService;

    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 124
    iget-object v0, p0, Lcom/tuenti/lostchallenge/service/SignalService$1;->this$0:Lcom/tuenti/lostchallenge/service/SignalService;

    #calls: Lcom/tuenti/lostchallenge/service/SignalService;->sendData()V
    invoke-static {v0}, Lcom/tuenti/lostchallenge/service/SignalService;->access$0(Lcom/tuenti/lostchallenge/service/SignalService;)V

    .line 126
    sget-boolean v0, Lcom/tuenti/lostchallenge/service/SignalService;->isConected:Z

    if-eqz v0, :cond_0

    .line 127
    iget-object v0, p0, Lcom/tuenti/lostchallenge/service/SignalService$1;->this$0:Lcom/tuenti/lostchallenge/service/SignalService;

    #getter for: Lcom/tuenti/lostchallenge/service/SignalService;->handler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/tuenti/lostchallenge/service/SignalService;->access$1(Lcom/tuenti/lostchallenge/service/SignalService;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/tuenti/lostchallenge/service/SignalService$1;->this$0:Lcom/tuenti/lostchallenge/service/SignalService;

    iget-object v1, v1, Lcom/tuenti/lostchallenge/service/SignalService;->sender:Ljava/lang/Runnable;

    const-wide/16 v2, 0x1388

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 130
    :cond_0
    return-void
.end method
