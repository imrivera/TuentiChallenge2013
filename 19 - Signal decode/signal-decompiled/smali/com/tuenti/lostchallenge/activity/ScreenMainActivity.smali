.class public Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;
.super Landroid/app/Activity;
.source "ScreenMainActivity.java"


# instance fields
.field private bt_start:Landroid/widget/Button;

.field private et_channel:Landroid/widget/EditText;

.field signalReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 20
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 116
    new-instance v0, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$1;

    invoke-direct {v0, p0}, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$1;-><init>(Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;)V

    iput-object v0, p0, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;->signalReceiver:Landroid/content/BroadcastReceiver;

    .line 20
    return-void
.end method

.method static synthetic access$0(Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;)Landroid/widget/Button;
    .locals 1
    .parameter

    .prologue
    .line 23
    iget-object v0, p0, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;->bt_start:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$1(Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;)Landroid/widget/EditText;
    .locals 1
    .parameter

    .prologue
    .line 22
    iget-object v0, p0, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;->et_channel:Landroid/widget/EditText;

    return-object v0
.end method

.method private hookListeners()V
    .locals 2

    .prologue
    .line 43
    iget-object v0, p0, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;->bt_start:Landroid/widget/Button;

    new-instance v1, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2;

    invoke-direct {v1, p0}, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2;-><init>(Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 91
    return-void
.end method

.method private mapUI()V
    .locals 2

    .prologue
    .line 94
    const v0, 0x7f070002

    invoke-virtual {p0, v0}, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;->et_channel:Landroid/widget/EditText;

    .line 95
    const v0, 0x7f070003

    invoke-virtual {p0, v0}, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;->bt_start:Landroid/widget/Button;

    .line 97
    sget-boolean v0, Lcom/tuenti/lostchallenge/service/SignalService;->isConected:Z

    if-eqz v0, :cond_0

    .line 98
    iget-object v0, p0, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;->bt_start:Landroid/widget/Button;

    const v1, 0x7f040006

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    .line 102
    :goto_0
    return-void

    .line 100
    :cond_0
    iget-object v0, p0, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;->bt_start:Landroid/widget/Button;

    const v1, 0x7f040005

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    goto :goto_0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "savedInstanceState"

    .prologue
    .line 27
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 28
    const/high16 v0, 0x7f03

    invoke-virtual {p0, v0}, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;->setContentView(I)V

    .line 30
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 112
    invoke-virtual {p0}, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f06

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 113
    const/4 v0, 0x1

    return v0
.end method

.method protected onDestroy()V
    .locals 0

    .prologue
    .line 107
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 108
    return-void
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 34
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 35
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "com.tuenti.signal"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 37
    .local v0, filter:Landroid/content/IntentFilter;
    invoke-direct {p0}, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;->mapUI()V

    .line 38
    invoke-direct {p0}, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;->hookListeners()V

    .line 40
    return-void
.end method
