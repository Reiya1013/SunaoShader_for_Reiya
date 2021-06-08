# SunaoShader_for_Reiya
[Sunaoシェーダー v1.4.4](https://booth.pm/ja/items/1723985)の改造シェーダーとなります。

追加機能は以下の通りとなります。  
![image](https://user-images.githubusercontent.com/62868883/118151355-81057780-b44e-11eb-839f-d50bbe22e1b8.png)  
Disolve : マスクに合わせて切り抜き処理が行われます。  
HiddenMode : VRCカメラだけに映らなくなったりするモードです。  
GamingMode : 色がゲーミングするよ。  

**Disolveオプション**  
![image](https://user-images.githubusercontent.com/62868883/118151595-bf9b3200-b44e-11eb-81d4-ffbe5d22dbfc.png)  
TeleportMode : DisolveThresHoldの値に合わせて砂嵐転送のような移動を行います。  
DisolveTexture : 切り抜きマスクを設定します。白黒の強度に合わせて切り抜きします。  
DisolveThreshold : Disolveの強弱設定します。この値をアニメーターで1→0と移動することで空間に現れるような動きをします。  
DisolveEmissionColor : Disolve中の加算色を設定します。
DisolveEmission : DisolveEmissionの強弱を設定します。
Blink : Emissionの速度を設定します。
Frequency : 点滅速度を設定します。
WaveForm : 点滅の種類を設定します。  

**HiddenModeオプション**  
![image](https://user-images.githubusercontent.com/62868883/118151933-23255f80-b44f-11eb-8364-267df97225e6.png)
![image](https://user-images.githubusercontent.com/62868883/118151951-27517d00-b44f-11eb-86b8-bfa4c1e5eeef.png)  
HiddenMode : OFF / VRCカメラに映らない / VRCカメラにはサブMainTextureを表示 / MainCameraにサブMainTextureを表示 / Mainカメラに映らない　からモード選択  
Main Texture(HiddenMode) : MainTextureに置き換わる画像を設定します。  
Emission Mask1&2(HiddenMode) : MainEmissionMaskにかわる画像を設定します。  

**GamingModeオプション**  
![image](https://user-images.githubusercontent.com/62868883/119250682-b80d2300-bbdc-11eb-8389-4666dcaa9ca6.png)  
GamingMode : ONにするだけでゲーミングするよ。
GamingSpeed : 色の変わるスピードを変更します。

**Hidden Distanceオプション**  
![image](https://user-images.githubusercontent.com/62868883/119250677-ae83bb00-bbdc-11eb-8145-7b0a6003ad81.png)  
Hidden Distance : カメラに映らなくなる距離を設定します。だいたいUnity上の距離と同等です。あまり大きくするとVRCのカメラにも映らなくなります。

# バグ報告
下記にお願いいたします。  
Twitter:Reiya  

# ライセンス
MIT license  
