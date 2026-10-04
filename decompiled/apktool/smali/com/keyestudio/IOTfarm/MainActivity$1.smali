.class Lcom/keyestudio/IOTfarm/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keyestudio/IOTfarm/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keyestudio/IOTfarm/MainActivity;


# direct methods
.method constructor <init>(Lcom/keyestudio/IOTfarm/MainActivity;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 107
    iput-object p1, p0, Lcom/keyestudio/IOTfarm/MainActivity$1;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 110
    iget-object p1, p0, Lcom/keyestudio/IOTfarm/MainActivity$1;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    invoke-static {p1}, Lcom/keyestudio/IOTfarm/MainActivity;->-$$Nest$fgetip(Lcom/keyestudio/IOTfarm/MainActivity;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/keyestudio/IOTfarm/MainActivity;->a:Ljava/lang/String;

    if-eqz p2, :cond_0

    .line 113
    iget-object p1, p0, Lcom/keyestudio/IOTfarm/MainActivity$1;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    const-string p2, "80"

    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p2

    iput p2, p1, Lcom/keyestudio/IOTfarm/MainActivity;->b:I

    .line 114
    iget-object p1, p0, Lcom/keyestudio/IOTfarm/MainActivity$1;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    new-instance p2, Lcom/keyestudio/IOTfarm/MainActivity$connectthread;

    iget-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity$1;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    invoke-direct {p2, v0}, Lcom/keyestudio/IOTfarm/MainActivity$connectthread;-><init>(Lcom/keyestudio/IOTfarm/MainActivity;)V

    iput-object p2, p1, Lcom/keyestudio/IOTfarm/MainActivity;->lianjie:Lcom/keyestudio/IOTfarm/MainActivity$connectthread;

    .line 115
    iget-object p1, p0, Lcom/keyestudio/IOTfarm/MainActivity$1;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    iget-object p1, p1, Lcom/keyestudio/IOTfarm/MainActivity;->lianjie:Lcom/keyestudio/IOTfarm/MainActivity$connectthread;

    invoke-virtual {p1}, Lcom/keyestudio/IOTfarm/MainActivity$connectthread;->start()V

    .line 116
    iget-object p1, p0, Lcom/keyestudio/IOTfarm/MainActivity$1;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    invoke-static {p1}, Lcom/keyestudio/IOTfarm/MainActivity;->-$$Nest$mautoSaveData(Lcom/keyestudio/IOTfarm/MainActivity;)V

    return-void

    .line 119
    :cond_0
    new-instance p1, Ljava/lang/Thread;

    new-instance p2, Lcom/keyestudio/IOTfarm/MainActivity$1$1;

    invoke-direct {p2, p0}, Lcom/keyestudio/IOTfarm/MainActivity$1$1;-><init>(Lcom/keyestudio/IOTfarm/MainActivity$1;)V

    invoke-direct {p1, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 134
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 135
    iget-object p1, p0, Lcom/keyestudio/IOTfarm/MainActivity$1;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    const-string p2, "Please enter IP"

    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 136
    iget-object p1, p0, Lcom/keyestudio/IOTfarm/MainActivity$1;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    iget-object p1, p1, Lcom/keyestudio/IOTfarm/MainActivity;->receive:Landroid/widget/TextView;

    const-string p2, ""

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 137
    iget-object p1, p0, Lcom/keyestudio/IOTfarm/MainActivity$1;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    iget-object p1, p1, Lcom/keyestudio/IOTfarm/MainActivity;->receive:Landroid/widget/TextView;

    const-string p2, "Connection closed"

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;)V

    return-void
.end method
