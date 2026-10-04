.class Lcom/keyestudio/IOTfarm/MainActivity$6$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keyestudio/IOTfarm/MainActivity$6;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/keyestudio/IOTfarm/MainActivity$6;

.field final synthetic val$motionEvent:Landroid/view/MotionEvent;


# direct methods
.method constructor <init>(Lcom/keyestudio/IOTfarm/MainActivity$6;Landroid/view/MotionEvent;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 326
    iput-object p1, p0, Lcom/keyestudio/IOTfarm/MainActivity$6$1;->this$1:Lcom/keyestudio/IOTfarm/MainActivity$6;

    iput-object p2, p0, Lcom/keyestudio/IOTfarm/MainActivity$6$1;->val$motionEvent:Landroid/view/MotionEvent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 330
    iget-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity$6$1;->this$1:Lcom/keyestudio/IOTfarm/MainActivity$6;

    iget-object v0, v0, Lcom/keyestudio/IOTfarm/MainActivity$6;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    iget-object v0, v0, Lcom/keyestudio/IOTfarm/MainActivity;->socket:Ljava/net/Socket;

    if-eqz v0, :cond_1

    .line 331
    iget-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity$6$1;->val$motionEvent:Landroid/view/MotionEvent;

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_0

    .line 341
    :try_start_0
    const-string v0, "bs"

    .line 342
    iget-object v1, p0, Lcom/keyestudio/IOTfarm/MainActivity$6$1;->this$1:Lcom/keyestudio/IOTfarm/MainActivity$6;

    iget-object v1, v1, Lcom/keyestudio/IOTfarm/MainActivity$6;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    iget-object v1, v1, Lcom/keyestudio/IOTfarm/MainActivity;->lianjie:Lcom/keyestudio/IOTfarm/MainActivity$connectthread;

    iget-object v1, v1, Lcom/keyestudio/IOTfarm/MainActivity$connectthread;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 344
    iget-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity$6$1;->this$1:Lcom/keyestudio/IOTfarm/MainActivity$6;

    iget-object v0, v0, Lcom/keyestudio/IOTfarm/MainActivity$6;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    sget v1, Lcom/keyestudio/IOTfarm/R$id;->watering_button:I

    invoke-virtual {v0, v1}, Lcom/keyestudio/IOTfarm/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 345
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    const-wide/16 v0, 0x1f4

    .line 354
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 356
    :goto_0
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 359
    :cond_0
    :goto_1
    iget-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity$6$1;->this$1:Lcom/keyestudio/IOTfarm/MainActivity$6;

    iget-object v0, v0, Lcom/keyestudio/IOTfarm/MainActivity$6;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    sget v1, Lcom/keyestudio/IOTfarm/R$id;->watering_button:I

    invoke-virtual {v0, v1}, Lcom/keyestudio/IOTfarm/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 360
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/16 v1, 0xff

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    return-void

    .line 362
    :cond_1
    iget-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity$6$1;->this$1:Lcom/keyestudio/IOTfarm/MainActivity$6;

    iget-object v0, v0, Lcom/keyestudio/IOTfarm/MainActivity$6;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    new-instance v1, Lcom/keyestudio/IOTfarm/MainActivity$6$1$1;

    invoke-direct {v1, p0}, Lcom/keyestudio/IOTfarm/MainActivity$6$1$1;-><init>(Lcom/keyestudio/IOTfarm/MainActivity$6$1;)V

    invoke-virtual {v0, v1}, Lcom/keyestudio/IOTfarm/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
