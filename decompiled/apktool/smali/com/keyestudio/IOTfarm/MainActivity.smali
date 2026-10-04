.class public Lcom/keyestudio/IOTfarm/MainActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keyestudio/IOTfarm/MainActivity$connectthread;
    }
.end annotation


# instance fields
.field Humidity:Landroid/widget/TextView;

.field Light:Landroid/widget/TextView;

.field Rainwater:Landroid/widget/TextView;

.field Soil_Humidity:Landroid/widget/TextView;

.field Temperature:Landroid/widget/TextView;

.field Water_Level:Landroid/widget/TextView;

.field a:Ljava/lang/String;

.field b:I

.field connect:Landroid/widget/Switch;

.field disconnectVal:Ljava/lang/Boolean;

.field fan_flag:I

.field intData:[I

.field private ip:Landroid/widget/EditText;

.field led_flag:I

.field lianjie:Lcom/keyestudio/IOTfarm/MainActivity$connectthread;

.field music_flag:I

.field receive:Landroid/widget/TextView;

.field servo_flag:I

.field socket:Ljava/net/Socket;

.field strs:[Ljava/lang/String;

.field text1:Ljava/lang/String;

.field watering_flag:I


# direct methods
.method static bridge synthetic -$$Nest$fgetip(Lcom/keyestudio/IOTfarm/MainActivity;)Landroid/widget/EditText;
    .locals 0

    iget-object p0, p0, Lcom/keyestudio/IOTfarm/MainActivity;->ip:Landroid/widget/EditText;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mautoSaveData(Lcom/keyestudio/IOTfarm/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/keyestudio/IOTfarm/MainActivity;->autoSaveData()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mdataHandle(Lcom/keyestudio/IOTfarm/MainActivity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/keyestudio/IOTfarm/MainActivity;->dataHandle(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 29
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 30
    const-string v0, "192.168.3.2"

    iput-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity;->a:Ljava/lang/String;

    const/16 v0, 0x50

    .line 31
    iput v0, p0, Lcom/keyestudio/IOTfarm/MainActivity;->b:I

    const/4 v0, 0x0

    .line 32
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/keyestudio/IOTfarm/MainActivity;->disconnectVal:Ljava/lang/Boolean;

    const/4 v1, 0x0

    .line 41
    iput-object v1, p0, Lcom/keyestudio/IOTfarm/MainActivity;->socket:Ljava/net/Socket;

    .line 42
    const-string v1, ""

    iput-object v1, p0, Lcom/keyestudio/IOTfarm/MainActivity;->text1:Ljava/lang/String;

    const/4 v1, 0x1

    .line 47
    iput v1, p0, Lcom/keyestudio/IOTfarm/MainActivity;->led_flag:I

    .line 48
    iput v1, p0, Lcom/keyestudio/IOTfarm/MainActivity;->music_flag:I

    .line 49
    iput v1, p0, Lcom/keyestudio/IOTfarm/MainActivity;->fan_flag:I

    .line 50
    iput v1, p0, Lcom/keyestudio/IOTfarm/MainActivity;->watering_flag:I

    .line 51
    iput v1, p0, Lcom/keyestudio/IOTfarm/MainActivity;->servo_flag:I

    const/4 v2, 0x2

    .line 53
    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "\u2103"

    aput-object v3, v2, v0

    const-string v0, "%"

    aput-object v0, v2, v1

    iput-object v2, p0, Lcom/keyestudio/IOTfarm/MainActivity;->strs:[Ljava/lang/String;

    const/4 v0, 0x6

    .line 54
    new-array v0, v0, [I

    iput-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity;->intData:[I

    return-void
.end method

.method private autoSaveData()V
    .locals 3

    .line 379
    iget-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity;->ip:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity;->text1:Ljava/lang/String;

    .line 380
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 381
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 382
    const-string v1, "text1"

    iget-object v2, p0, Lcom/keyestudio/IOTfarm/MainActivity;->text1:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 383
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 384
    const-string v0, "IP saved!"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method private dataHandle(Ljava/lang/String;)V
    .locals 7

    .line 399
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 400
    div-int/lit8 v1, v0, 0x2

    rem-int/lit8 v2, v0, 0x2

    add-int/2addr v1, v2

    new-array v2, v1, [Ljava/lang/String;

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v0, :cond_1

    add-int/lit8 v5, v0, -0x1

    if-ne v4, v5, :cond_0

    .line 403
    div-int/lit8 v5, v4, 0x2

    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v5

    goto :goto_1

    .line 405
    :cond_0
    div-int/lit8 v5, v4, 0x2

    add-int/lit8 v6, v4, 0x2

    invoke-virtual {p1, v4, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v5

    :goto_1
    add-int/lit8 v4, v4, 0x2

    goto :goto_0

    .line 411
    :cond_1
    new-array p1, v1, [I

    move v0, v3

    :goto_2
    if-ge v0, v1, :cond_2

    .line 413
    aget-object v4, v2, v0

    const/16 v5, 0x10

    invoke-static {v4, v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v4

    aput v4, p1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_2
    const/4 v0, 0x6

    .line 416
    new-array v2, v0, [I

    .line 417
    aget v4, p1, v3

    if-nez v4, :cond_3

    .line 418
    aput v3, v2, v3

    const/4 v4, 0x1

    .line 419
    aput v3, v2, v4

    .line 420
    aget v3, p1, v4

    const/4 v4, 0x2

    aput v3, v2, v4

    .line 421
    aget v3, p1, v4

    const/4 v4, 0x3

    aput v3, v2, v4

    .line 422
    aget v3, p1, v4

    const/4 v4, 0x4

    aput v3, v2, v4

    const/4 v3, 0x5

    .line 423
    aget v4, p1, v4

    aput v4, v2, v3

    .line 427
    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, ":"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "\u6570\u7ec4\u957f\u5ea6"

    invoke-static {v4, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    if-ne v1, v0, :cond_4

    .line 429
    iput-object p1, p0, Lcom/keyestudio/IOTfarm/MainActivity;->intData:[I

    return-void

    .line 431
    :cond_4
    iput-object v2, p0, Lcom/keyestudio/IOTfarm/MainActivity;->intData:[I

    return-void
.end method

.method private outData()V
    .locals 3

    .line 388
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 389
    const-string v1, "text1"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-ne v0, v2, :cond_0

    .line 391
    const-string v0, "192.168.3.2"

    .line 393
    :cond_0
    iget-object v1, p0, Lcom/keyestudio/IOTfarm/MainActivity;->ip:Landroid/widget/EditText;

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6

    .line 61
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 63
    sget p1, Lcom/keyestudio/IOTfarm/R$layout;->activity_main2:I

    invoke-virtual {p0, p1}, Lcom/keyestudio/IOTfarm/MainActivity;->setContentView(I)V

    .line 65
    invoke-virtual {p0}, Lcom/keyestudio/IOTfarm/MainActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 67
    invoke-virtual {p1}, Landroidx/appcompat/app/ActionBar;->hide()V

    .line 71
    :cond_0
    invoke-virtual {p0}, Lcom/keyestudio/IOTfarm/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v0, 0x80

    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    .line 76
    sget p1, Lcom/keyestudio/IOTfarm/R$id;->mEtIP:I

    invoke-virtual {p0, p1}, Lcom/keyestudio/IOTfarm/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/keyestudio/IOTfarm/MainActivity;->ip:Landroid/widget/EditText;

    .line 78
    sget p1, Lcom/keyestudio/IOTfarm/R$id;->receive:I

    invoke-virtual {p0, p1}, Lcom/keyestudio/IOTfarm/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/keyestudio/IOTfarm/MainActivity;->receive:Landroid/widget/TextView;

    .line 79
    sget p1, Lcom/keyestudio/IOTfarm/R$id;->temp:I

    invoke-virtual {p0, p1}, Lcom/keyestudio/IOTfarm/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/keyestudio/IOTfarm/MainActivity;->Temperature:Landroid/widget/TextView;

    .line 80
    sget p1, Lcom/keyestudio/IOTfarm/R$id;->HB:I

    invoke-virtual {p0, p1}, Lcom/keyestudio/IOTfarm/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/keyestudio/IOTfarm/MainActivity;->Humidity:Landroid/widget/TextView;

    .line 81
    sget p1, Lcom/keyestudio/IOTfarm/R$id;->S_HB:I

    invoke-virtual {p0, p1}, Lcom/keyestudio/IOTfarm/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/keyestudio/IOTfarm/MainActivity;->Soil_Humidity:Landroid/widget/TextView;

    .line 82
    sget p1, Lcom/keyestudio/IOTfarm/R$id;->W_L:I

    invoke-virtual {p0, p1}, Lcom/keyestudio/IOTfarm/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/keyestudio/IOTfarm/MainActivity;->Water_Level:Landroid/widget/TextView;

    .line 83
    sget p1, Lcom/keyestudio/IOTfarm/R$id;->Lig:I

    invoke-virtual {p0, p1}, Lcom/keyestudio/IOTfarm/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/keyestudio/IOTfarm/MainActivity;->Light:Landroid/widget/TextView;

    .line 84
    sget p1, Lcom/keyestudio/IOTfarm/R$id;->Rai:I

    invoke-virtual {p0, p1}, Lcom/keyestudio/IOTfarm/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/keyestudio/IOTfarm/MainActivity;->Rainwater:Landroid/widget/TextView;

    .line 86
    sget p1, Lcom/keyestudio/IOTfarm/R$id;->connect_button:I

    invoke-virtual {p0, p1}, Lcom/keyestudio/IOTfarm/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Switch;

    iput-object p1, p0, Lcom/keyestudio/IOTfarm/MainActivity;->connect:Landroid/widget/Switch;

    .line 87
    sget p1, Lcom/keyestudio/IOTfarm/R$id;->led_button:I

    invoke-virtual {p0, p1}, Lcom/keyestudio/IOTfarm/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    .line 88
    sget v0, Lcom/keyestudio/IOTfarm/R$id;->servo_button:I

    invoke-virtual {p0, v0}, Lcom/keyestudio/IOTfarm/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 89
    sget v1, Lcom/keyestudio/IOTfarm/R$id;->music_button:I

    invoke-virtual {p0, v1}, Lcom/keyestudio/IOTfarm/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 90
    sget v2, Lcom/keyestudio/IOTfarm/R$id;->fan_button:I

    invoke-virtual {p0, v2}, Lcom/keyestudio/IOTfarm/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 91
    sget v3, Lcom/keyestudio/IOTfarm/R$id;->watering_button:I

    invoke-virtual {p0, v3}, Lcom/keyestudio/IOTfarm/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    .line 104
    invoke-direct {p0}, Lcom/keyestudio/IOTfarm/MainActivity;->outData()V

    .line 107
    iget-object v4, p0, Lcom/keyestudio/IOTfarm/MainActivity;->connect:Landroid/widget/Switch;

    new-instance v5, Lcom/keyestudio/IOTfarm/MainActivity$1;

    invoke-direct {v5, p0}, Lcom/keyestudio/IOTfarm/MainActivity$1;-><init>(Lcom/keyestudio/IOTfarm/MainActivity;)V

    invoke-virtual {v4, v5}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 146
    new-instance v4, Lcom/keyestudio/IOTfarm/MainActivity$2;

    invoke-direct {v4, p0}, Lcom/keyestudio/IOTfarm/MainActivity$2;-><init>(Lcom/keyestudio/IOTfarm/MainActivity;)V

    invoke-virtual {p1, v4}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 190
    new-instance p1, Lcom/keyestudio/IOTfarm/MainActivity$3;

    invoke-direct {p1, p0}, Lcom/keyestudio/IOTfarm/MainActivity$3;-><init>(Lcom/keyestudio/IOTfarm/MainActivity;)V

    invoke-virtual {v1, p1}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 235
    new-instance p1, Lcom/keyestudio/IOTfarm/MainActivity$4;

    invoke-direct {p1, p0}, Lcom/keyestudio/IOTfarm/MainActivity$4;-><init>(Lcom/keyestudio/IOTfarm/MainActivity;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 278
    new-instance p1, Lcom/keyestudio/IOTfarm/MainActivity$5;

    invoke-direct {p1, p0}, Lcom/keyestudio/IOTfarm/MainActivity$5;-><init>(Lcom/keyestudio/IOTfarm/MainActivity;)V

    invoke-virtual {v2, p1}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 323
    new-instance p1, Lcom/keyestudio/IOTfarm/MainActivity$6;

    invoke-direct {p1, p0}, Lcom/keyestudio/IOTfarm/MainActivity$6;-><init>(Lcom/keyestudio/IOTfarm/MainActivity;)V

    invoke-virtual {v3, p1}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method
