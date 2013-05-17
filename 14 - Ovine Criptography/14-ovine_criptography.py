#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Tuenti Challenge 3
#
# Challenge 14 - Ovine Cryptography

# I will name my sheeps as 'Alice' and 'Bob'

import sys
import binascii
import string

texts = [   '5cb4290b0a901940ac5392061f0714b9109ae565951780dc81171f50fbd919aba08c1d9dce850618bd46d9237a578eae5b9f71f8b2312719a0bf05800e808c9007e24c1bef35fb8aaa07681557842453bb3a81c30d28ecb5d295bc24739b9eb6405d83d4ab05cd82b3b238720a569bb1d526f4132271188578862008c3afae028c793be44e26ff46397a9b62bde49a2df643e6ed755b8c6e48c785d008c9855f2c5d5dea2bb184fa1c7a070d2c39f596190d5fd10021c337a32eb8480e0c7bf0',
            '5cfa390116d21e14b25c9b1e465f5bf8129ae27e94088b9bc80e1d1fe4c21ca2bb9644dcc9990618a64edc66655d82f9479d7ba0f7586e1de1b718ce139bc9df44de4d17ea70b290e70b27114697311aac2cccd10a28f7a9db9abc3e7480cbb55140c193f544f6d6bebe23391f0480a99b34bb156d2111837e8f6547dae7a84ccf6c3da1002bec42392e9a27bfe7d722ea11a5f568508a7911de88db4ac9a41e2d5913f26ea39ffa047b18066b25b5',
            '54b42b0517c34d17b44098525e1114ec05d9e27e910dc59f8714064de8ce1db7bd910bd394cd3d57bf40c2237e40d8b6589b7fa7b211694ea0bf51c5029bde9409ef4907b937b48ca34a621f42883856aa63ced14535f1a1d9ddff25729bccb35a519dc7ec4aea82a3aa3975091389bbc872b500227f54a52e82730cc8ebe70d8c6a3af3026eee486b698762a6ed9a22ea07a5f56941903c5ccfcc9e4081a95f285d5afa2be285b55e34',
            '38b4041744c30505a957dc13510a5be91e90e378d0158adc9f121b5ce18d01a8bcd813d2cf811057bf48c26b375ac1f9509f7bb4b2157e4ea0a505c5149bc59e0ab50553b904b4c3b302624740903a53a036d2970c34e0a9d198f23e3c80d8f24d5c8893e14ae382beb376211613ccbed235bc1360251d816bcd204a8ddbaf098c693ce64e2af3436b608736baebd427af0aeba2745d9d3c5fc387d647c4b81636591dbe26e5bfb21167511f6d25bbc218065fdf0c73cb28b72fec4c050166ba38bc97fb30d1b49d33898b30db89d50248ed99da05f6e4afe6f02a7c5dcb',
            '59f5291d44f0010fa8419502055336eb5fd9da639f1291999a565257e6da58b0a68d08d99a941b02e852c4736741dcad148c3ab4fb1e6251e19314d20e86c9d133e54a0ded35a9d9e73d620b4fc96873ef30d4c71535f0a59594e86a788aceb757509e93ea4ba4d5bfb271265e0185b6de72bd136d26159f22c36147c1e6b318c06873e60b20ee4b2e2e9830b7f1c935fd06a5e0655b9d7d45c2c0ca5b8cec1a375e5ce92bb283b31c76510b7e39e8c5190d189c1821c032b125ec561f106abb29f296a465c2bd9c2bdb863ccbdaa61e45fad5d70ff1a8c9',
            '5ce06a1744d64d06ae5c920b1f0713f01f9ead6d920e9088c8161d50e2c416a0e99e0bcf9a991c1ea646c22d3767c8f94d826fe3fa0d691ae1b71ed25a8e8c9f01ef4112fc70b28de70b270f429c3b4eae20ca971c35f6e0d192f26d68cfd8bb5750cddaf10ba4ebb1fd2f3a0b5688bfd575a0472a3802892e822003ccfda94cdb6536f5062be80732619d62b7f4df32af10e0e72041907911c485db5785a95f344e13f064b1cbb30433031d6225bbdf1e17109c006ed767b634a9050d0b7dad29f297be7dc6f1893d8ec039dac8e84a4cf894dc08eeb0c7fdf422395d91e0aebcb4',
            '46fb200144df180dba5c8f52481c0ef515d9e963d0008b859c121b51ee8d0ca8e98b01d89a841257a1559174765d8ea95b9e69aaf014624eb5be51c415cfc5854aaa6c18b929b496e71a721303846856ae31c6d24529f4a9c19ef46a75819ea156598893e644f2c7f7ae39381b0184b5c937f8473a3800842e822014c4e8a94cc36373e81a6ee94632678625f2a5ff2eeb4eeae42d4190791cfd8fcc5f8dec2c2c5547fd63ebcb8a3c56303b4976dff9502d30e85955ed128114eb094b1667bb7da282be7ed7f1873d8e8c31d18ef24a48e990db46f5a591ecbc33704380a1b9b8babcdb4fe3',
            '41fc281601970413fb53dc004a1e14ec03d9ea63990f82dc89081d4ae7c958b3a199109df3cd1c16be449165785bc0bd14aa75a7bc584e4eb5b918ce11cfd8990df90517ea70ae8dab036c024f9c6858aa20c0c2163fa3899595fd3c79cfdbbc56418adba541edc4b1b43520120295f0dd3bba03243f13cc639a200cc8f6b4408c6c3de54e3af242396bc82ba1a2df2dff0af7eb6354943c54dc89da5687af1a7b485bff7fe59fb2156a510d743fe8c25e',
            '5cfa6d0205d4194cfb4694171f1e1eeb14d9ec6f84418a9ac815025ae7c416a0e98c0cd89a8f1b0fe856d86f7b0ecabc408868aefb16624eb5b91480099bcd8501aa4a18b924b386e70966130fc52956bb2bcec20232a3a9dbdde822759c9eb158478893f14de1d0b2fd21300c13cca4d320b1026d3511986b916d0ec3eeb3098c7e27e01a2be9073f668d62b1e3ce60ec0cf0ee64159a7911c38e84139da41a285913fc6eac85bd50521d017a33b79634061ed85521c329a67c8e49040d6ba77d9496a579cca4837c',
            '46f724010ac30413af41dc1a5e051eb91298e16f850d84888d1e524be1cc0ce7bd90019dd9851519ab44c22378488eaa5b807fb7fa116909e1a21e800a8ed8940afe4907b931b990b218634742863c4fae2fcdce453ffba9c689f5247bcfdfa05c1480dae949edcdb9ae7621115683bede7cf425382554816f846904c4eea91f8c6532f70b6ef946276d9d2eb3f6df24af17ede3741595755dc689d15dc4b81076535dfb2ba683bb1e70141b2c35e9d900430acc596fcb29a77cb84c06077cfe32a797f77fc5f1843795ce',
            '41fc284417c30212a2128f1d1f151aeb4bd9c462d0158d99c8181758e0c316aea79f44c9d2885422a648c766655dcbf9438c69e3f10a620fb5b4158e5abbc49817aa4d1fea70b682a30f27060389274eef2cc797153fecb0d998bc3c799dc7f2585a8ac1fc05e5ccb3fd34301b18cca7d236b10b3471068969827203c8ebe70ddf2d32a10c2ffe0726619e27fc',
            '54b42e0b09da020efb5f95014b1210fc518de56d84419599870a1e5aa9c019acacd813d5df835403ba58d86d700edab614897fb0fb1f694eb2be1cc50e87c59f03aa4611f420b786b30f6b1e03832755a333d3d80a3ca3a9c6dde8253c9ad0b65c4688c0f14ce9c3a3b876211613ccb9d535b109383800952e8c6647cee0aa1cc06827e44e28f548277dc6',
            '58ed6d000bd4190fa9128f1346005bed1998f92cb9418d9d9e1f525ea9c019abaf9716d0df895407bd43dd6a7403caac40943aa4fe19690ae1b01fc45a8e8c9f05fe500cf83cfb87a20c6e044a802659b663c8d94537ecb2d491bc2c758dccb7195583d7a551ecc3a3fd1f751f1bcca4d337a6022b3e06892e867804d8fca2088c6b21ee036ee9463d678625f2f7d429f906f7f16546d6',
        ]


printable = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 -!?*/&%$.,()+'@#"

cracked_key = "15944d6464b76d60db32fc723f737b9971f98d0cf061e5fce87a723f89ad78c7c9f864bdbaed7477c821b103172eaed934ed1ac39278076ec1d171a07aefacf1648a257e9950dbe3c76a076723e5483acf43a1b7655a83c0b5fd9c4a1cefbed23934edb3852584a2d7dd56557e76ecd0bb52d4674d5174ec0ee30067ad8fc76cac0d53816e4e9a274b0ee842d282ba408f6385820035f81c31aae0be33e9cc7f5b3c339e0bc5ebda701371680c569bb670637fbc7901a247c25ccc256b620fde5dd2e3d710a3d1f052fbe055bfa9866a2d9ff5b5669dc4e7899c47192ee581cdd79ad8a936cd"

def decode_text(text, key):
    ciphertext = binascii.unhexlify(text)
    bin_key = binascii.unhexlify(key)
    
    s = ''
    
    for c, k in zip(ciphertext, bin_key):
        s += chr(ord(c) ^ ord(k))
        
    return s


if __name__ == '__main__':
    for line in sys.stdin:
        line = line.rstrip('\r\n ')
        print decode_text(line, cracked_key)

'''

# DIRTY HACKY CODE HEAD. DON'T STARE DIRECTLY, IT WILL BURN YOUR EYES

def xor_strings(s1, s2):
    global printable
    s = ''
    for a, b in zip(s1, s2):
        c = chr((ord(a) ^ ord(b)) & 0xFF)
        s += c
            
            
    return s
        

def fill_key(key, ciphertext, pos, text):
    ciphertext = binascii.unhexlify(ciphertext)
    l = min(len(ciphertext), len(text))
        
    for i in range(l):
        #print "ciphertext 0x%02x   text  0x%02x  %s" % (ord(ciphertext[i+pos]), ord(text[i]), text[i])
        key[pos + i] = ord(ciphertext[i+pos]) ^ ord(text[i])
        
def get_decoded(key, partial_key, ciphertext):
    global printable
    s = ''
    for i in range(len(ciphertext)):
        if not i in partial_key:
            c= '.'
        else:
            c = chr(ord(ciphertext[i]) ^ ord(key[i]))
            if c not in printable:
                c = '.'
                
        s += c
        
    return s
    
def complete_key(partial_key, length):
    key = []
    for i in range(length):
        if i in partial_key:
            key.append(chr(partial_key[i]))
        else:
            key.append(chr(0))
            
    return "".join(key)
        
if __name__ == '__main__':

    partial_key = {}
    fill_key(partial_key, texts[3], 129, "dog did nothing in the night-time");
    #fill_key(partial_key, texts[3], 129, "and there is em")
    #print key
    fill_key(partial_key, texts[0], 129, "the hearts of my countrymen");
    fill_key(partial_key, texts[0], 90, " not dying. I don't want to live on in the hearts of my countrymen. ")
    fill_key(partial_key, texts[5], 128, "whether");
    fill_key(partial_key, texts[11], 124, "complete fools");
    fill_key(partial_key, texts[11], 92, " underestimate the ingenuity of complete fools");
    fill_key(partial_key, texts[6], 122, " sign on it saying 'End-of-the-World Switch. PLEASE DO NOT TOUCH', the paint wouldn't even have time to dry.")
    fill_key(partial_key, texts[2], 120, " asked")
    fill_key(partial_key, texts[1], 116, " people who can never remember where they")
    fill_key(partial_key, texts[0], 109, " want to live on in the heart")
    fill_key(partial_key, texts[0], 121, "e on in the hearts of my cou")
    fill_key(partial_key, texts[7], 142, "empirical evidence")
    fill_key(partial_key, texts[1], 99, " particularly for people who can never remember")
    fill_key(partial_key, texts[6], 0,"Some humans would do anything to see if it was possible to do it. If you put a large switch in some cave")
    #fill_key(partial_key, texts[0], 147, "beneath ")
    #sys.exit()
    
    
    key = complete_key(partial_key, max([len(x)/2 for x in texts]))
    print binascii.hexlify(key)
    
    #test_word = "an never remember"
    test_word = "Some humans would do anything to see if it was possible to do it. If you put a large switch in some cave"
    #test_word = ")Bee is"

    for i in range(len(texts)):
        for j in range(i + 1, len(texts)):
                bin1 = binascii.unhexlify(texts[i])
                bin2 = binascii.unhexlify(texts[j])
                
                print "------------------------------------------------------"
                print "i%d j%d" % (i, j)
                print "test_word = {%s}" % (test_word)
                print
                print get_decoded(key, partial_key, bin1)
                print "--"
                print get_decoded(key, partial_key, bin2)
                print
                x = xor_strings(bin1, bin2)
                for pos in range(len(x) - len(test_word)):
                    l = []
                    for pos_test in range(len(test_word)):
                        #print pos + pos_test
                        l.append(chr(ord(x[pos + pos_test]) ^ ord(test_word[pos_test])))
                        
                    if all([ c in printable for c in l ]):
                        #print l
                        print "         pos = %d, test = {%s}" % (pos, "".join(l))
                        
                print
                print
'''
                
            

