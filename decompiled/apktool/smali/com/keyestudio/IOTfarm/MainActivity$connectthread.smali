.class Lcom/keyestudio/IOTfarm/MainActivity$connectthread;
.super Ljava/lang/Thread;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keyestudio/IOTfarm/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "connectthread"
.end annotation


# instance fields
.field inputStream:Ljava/io/InputStream;

.field outputStream:Ljava/io/OutputStream;

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

    .line 442
    iput-object p1, p0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    const/4 p1, 0x0

    .line 444
    iput-object p1, p0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread;->outputStream:Ljava/io/OutputStream;

    .line 445
    iput-object p1, p0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread;->inputStream:Ljava/io/InputStream;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 452
    :try_start_0
    iget-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    new-instance v1, Ljava/net/Socket;

    iget-object v2, p0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    iget-object v2, v2, Lcom/keyestudio/IOTfarm/MainActivity;->a:Ljava/lang/String;

    iget-object v3, p0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    iget v3, v3, Lcom/keyestudio/IOTfarm/MainActivity;->b:I

    invoke-direct {v1, v2, v3}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V

    iput-object v1, v0, Lcom/keyestudio/IOTfarm/MainActivity;->socket:Ljava/net/Socket;

    .line 453
    iget-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    new-instance v1, Lcom/keyestudio/IOTfarm/MainActivity$connectthread$1;

    invoke-direct {v1, p0}, Lcom/keyestudio/IOTfarm/MainActivity$connectthread$1;-><init>(Lcom/keyestudio/IOTfarm/MainActivity$connectthread;)V

    invoke-virtual {v0, v1}, Lcom/keyestudio/IOTfarm/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 479
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 480
    iget-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    new-instance v1, Lcom/keyestudio/IOTfarm/MainActivity$connectthread$3;

    invoke-direct {v1, p0}, Lcom/keyestudio/IOTfarm/MainActivity$connectthread$3;-><init>(Lcom/keyestudio/IOTfarm/MainActivity$connectthread;)V

    invoke-virtual {v0, v1}, Lcom/keyestudio/IOTfarm/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0

    :catch_1
    move-exception v0

    .line 467
    iget-object v1, p0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    new-instance v2, Lcom/keyestudio/IOTfarm/MainActivity$connectthread$2;

    invoke-direct {v2, p0}, Lcom/keyestudio/IOTfarm/MainActivity$connectthread$2;-><init>(Lcom/keyestudio/IOTfarm/MainActivity$connectthread;)V

    invoke-virtual {v1, v2}, Lcom/keyestudio/IOTfarm/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 477
    invoke-virtual {v0}, Ljava/net/UnknownHostException;->printStackTrace()V

    .line 491
    :goto_0
    iget-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    iget-object v0, v0, Lcom/keyestudio/IOTfarm/MainActivity;->socket:Ljava/net/Socket;

    if-eqz v0, :cond_0

    .line 494
    :try_start_1
    iget-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    iget-object v0, v0, Lcom/keyestudio/IOTfarm/MainActivity;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    iput-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread;->outputStream:Ljava/io/OutputStream;

    const/16 v1, 0x7b

    .line 495
    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_1

    :catch_2
    move-exception v0

    .line 497
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :goto_1
    const/16 v0, 0x400

    .line 503
    :try_start_2
    new-array v0, v0, [B

    .line 504
    iget-object v1, p0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    iget-object v1, v1, Lcom/keyestudio/IOTfarm/MainActivity;->socket:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    iput-object v1, p0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread;->inputStream:Ljava/io/InputStream;

    .line 505
    invoke-virtual {v1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .line 507
    new-instance v2, Ljava/lang/String;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v3, v1}, Ljava/lang/String;-><init>([BII)V

    .line 510
    const-string v0, "esp32\u53d1\u9001\u8fc7\u6765\u7684\u503c"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u503c\uff1a"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 512
    iget-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    invoke-static {v0, v2}, Lcom/keyestudio/IOTfarm/MainActivity;->-$$Nest$mdataHandle(Lcom/keyestudio/IOTfarm/MainActivity;Ljava/lang/String;)V

    .line 515
    iget-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    new-instance v1, Lcom/keyestudio/IOTfarm/MainActivity$connectthread$4;

    invoke-direct {v1, p0}, Lcom/keyestudio/IOTfarm/MainActivity$connectthread$4;-><init>(Lcom/keyestudio/IOTfarm/MainActivity$connectthread;)V

    invoke-virtual {v0, v1}, Lcom/keyestudio/IOTfarm/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    goto :goto_1

    :catch_3
    :cond_0
    return-void
.end method
