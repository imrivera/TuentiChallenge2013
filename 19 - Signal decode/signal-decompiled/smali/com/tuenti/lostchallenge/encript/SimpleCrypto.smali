.class public Lcom/tuenti/lostchallenge/encript/SimpleCrypto;
.super Ljava/lang/Object;
.source "SimpleCrypto.java"


# instance fields
.field dcipher:Ljavax/crypto/Cipher;

.field ecipher:Ljavax/crypto/Cipher;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 8
    .parameter "password"

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const/16 v6, 0x8

    new-array v5, v6, [B

    fill-array-data v5, :array_0

    .line 50
    .local v5, salt:[B
    const/16 v1, 0x13

    .line 54
    .local v1, iterationCount:I
    :try_start_0
    new-instance v3, Ljavax/crypto/spec/PBEKeySpec;

    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v6

    invoke-direct {v3, v6, v5, v1}, Ljavax/crypto/spec/PBEKeySpec;-><init>([C[BI)V

    .line 55
    .local v3, keySpec:Ljava/security/spec/KeySpec;
    const-string v6, "PBEWithMD5AndDES"

    invoke-static {v6}, Ljavax/crypto/SecretKeyFactory;->getInstance(Ljava/lang/String;)Ljavax/crypto/SecretKeyFactory;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    move-result-object v2

    .line 57
    .local v2, key:Ljavax/crypto/SecretKey;
    invoke-interface {v2}, Ljavax/crypto/SecretKey;->getAlgorithm()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v6

    iput-object v6, p0, Lcom/tuenti/lostchallenge/encript/SimpleCrypto;->ecipher:Ljavax/crypto/Cipher;

    .line 58
    invoke-interface {v2}, Ljavax/crypto/SecretKey;->getAlgorithm()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v6

    iput-object v6, p0, Lcom/tuenti/lostchallenge/encript/SimpleCrypto;->dcipher:Ljavax/crypto/Cipher;

    .line 61
    new-instance v4, Ljavax/crypto/spec/PBEParameterSpec;

    invoke-direct {v4, v5, v1}, Ljavax/crypto/spec/PBEParameterSpec;-><init>([BI)V

    .line 63
    .local v4, paramSpec:Ljava/security/spec/AlgorithmParameterSpec;
    iget-object v6, p0, Lcom/tuenti/lostchallenge/encript/SimpleCrypto;->ecipher:Ljavax/crypto/Cipher;

    const/4 v7, 0x1

    invoke-virtual {v6, v7, v2, v4}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 64
    iget-object v6, p0, Lcom/tuenti/lostchallenge/encript/SimpleCrypto;->dcipher:Ljavax/crypto/Cipher;

    const/4 v7, 0x2

    invoke-virtual {v6, v7, v2, v4}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V
    :try_end_0
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/spec/InvalidKeySpecException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_4

    .line 77
    .end local v2           #key:Ljavax/crypto/SecretKey;
    .end local v3           #keySpec:Ljava/security/spec/KeySpec;
    .end local v4           #paramSpec:Ljava/security/spec/AlgorithmParameterSpec;
    :goto_0
    return-void

    .line 66
    :catch_0
    move-exception v0

    .line 67
    .local v0, e:Ljava/security/InvalidAlgorithmParameterException;
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v7, "EXCEPTION: InvalidAlgorithmParameterException"

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0

    .line 68
    .end local v0           #e:Ljava/security/InvalidAlgorithmParameterException;
    :catch_1
    move-exception v0

    .line 69
    .local v0, e:Ljava/security/spec/InvalidKeySpecException;
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v7, "EXCEPTION: InvalidKeySpecException"

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0

    .line 70
    .end local v0           #e:Ljava/security/spec/InvalidKeySpecException;
    :catch_2
    move-exception v0

    .line 71
    .local v0, e:Ljavax/crypto/NoSuchPaddingException;
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v7, "EXCEPTION: NoSuchPaddingException"

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0

    .line 72
    .end local v0           #e:Ljavax/crypto/NoSuchPaddingException;
    :catch_3
    move-exception v0

    .line 73
    .local v0, e:Ljava/security/NoSuchAlgorithmException;
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v7, "EXCEPTION: NoSuchAlgorithmException"

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0

    .line 74
    .end local v0           #e:Ljava/security/NoSuchAlgorithmException;
    :catch_4
    move-exception v0

    .line 75
    .local v0, e:Ljava/security/InvalidKeyException;
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v7, "EXCEPTION: InvalidKeyException"

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0

    .line 44
    :array_0
    .array-data 0x1
        0xa9t
        0x9bt
        0xc8t
        0x32t
        0x56t
        0x34t
        0xe3t
        0x3t
    .end array-data
.end method


# virtual methods
.method public decrypt(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "str"

    .prologue
    .line 120
    const/4 v2, 0x0

    :try_start_0
    invoke-static {p1, v2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    .line 123
    .local v0, dec:[B
    iget-object v2, p0, Lcom/tuenti/lostchallenge/encript/SimpleCrypto;->dcipher:Ljavax/crypto/Cipher;

    invoke-virtual {v2, v0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v1

    .line 126
    .local v1, utf8:[B
    new-instance v2, Ljava/lang/String;

    const-string v3, "UTF8"

    invoke-direct {v2, v1, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljavax/crypto/BadPaddingException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 133
    .end local v0           #dec:[B
    .end local v1           #utf8:[B
    :goto_0
    return-object v2

    .line 131
    :catch_0
    move-exception v2

    .line 133
    :goto_1
    const/4 v2, 0x0

    goto :goto_0

    .line 130
    :catch_1
    move-exception v2

    goto :goto_1

    .line 129
    :catch_2
    move-exception v2

    goto :goto_1

    .line 128
    :catch_3
    move-exception v2

    goto :goto_1
.end method

.method public encrypt(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "str"

    .prologue
    .line 89
    :try_start_0
    const-string v2, "UTF8"

    invoke-virtual {p1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 92
    .local v1, utf8:[B
    iget-object v2, p0, Lcom/tuenti/lostchallenge/encript/SimpleCrypto;->ecipher:Ljavax/crypto/Cipher;

    invoke-virtual {v2, v1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v0

    .line 97
    .local v0, enc:[B
    new-instance v2, Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {v0, v3}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/String;-><init>([B)V
    :try_end_0
    .catch Ljavax/crypto/BadPaddingException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 104
    .end local v0           #enc:[B
    .end local v1           #utf8:[B
    :goto_0
    return-object v2

    .line 102
    :catch_0
    move-exception v2

    .line 104
    :goto_1
    const/4 v2, 0x0

    goto :goto_0

    .line 101
    :catch_1
    move-exception v2

    goto :goto_1

    .line 100
    :catch_2
    move-exception v2

    goto :goto_1

    .line 99
    :catch_3
    move-exception v2

    goto :goto_1
.end method
