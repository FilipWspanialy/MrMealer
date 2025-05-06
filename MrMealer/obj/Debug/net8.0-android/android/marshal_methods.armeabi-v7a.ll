; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [325 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [644 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 67
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 66
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 107
	i32 26230656, ; 3: Microsoft.Extensions.DependencyModel => 0x1903f80 => 182
	i32 32687329, ; 4: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 244
	i32 34715100, ; 5: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 278
	i32 34839235, ; 6: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 47
	i32 39109920, ; 7: Newtonsoft.Json.dll => 0x254c520 => 194
	i32 39485524, ; 8: System.Net.WebSockets.dll => 0x25a8054 => 79
	i32 42639949, ; 9: System.Threading.Thread => 0x28aa24d => 142
	i32 66541672, ; 10: System.Diagnostics.StackTrace => 0x3f75868 => 29
	i32 67008169, ; 11: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 319
	i32 68219467, ; 12: System.Security.Cryptography.Primitives => 0x410f24b => 123
	i32 72070932, ; 13: Microsoft.Maui.Graphics.dll => 0x44bb714 => 193
	i32 82292897, ; 14: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 101
	i32 101534019, ; 15: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 262
	i32 117431740, ; 16: System.Runtime.InteropServices => 0x6ffddbc => 106
	i32 120558881, ; 17: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 262
	i32 122350210, ; 18: System.Threading.Channels.dll => 0x74aea82 => 136
	i32 134690465, ; 19: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 282
	i32 142721839, ; 20: System.Net.WebHeaderCollection => 0x881c32f => 76
	i32 149972175, ; 21: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 123
	i32 159306688, ; 22: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 23: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 218
	i32 176265551, ; 24: System.ServiceProcess => 0xa81994f => 131
	i32 182336117, ; 25: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 264
	i32 184328833, ; 26: System.ValueTuple.dll => 0xafca281 => 148
	i32 195452805, ; 27: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 316
	i32 199333315, ; 28: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 317
	i32 205061960, ; 29: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 30: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 216
	i32 220171995, ; 31: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 32: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 238
	i32 230752869, ; 33: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 34: System.Linq.Parallel => 0xdcb05c4 => 58
	i32 231814094, ; 35: System.Globalization => 0xdd133ce => 41
	i32 246610117, ; 36: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 90
	i32 261689757, ; 37: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 221
	i32 276479776, ; 38: System.Threading.Timer.dll => 0x107abf20 => 144
	i32 278686392, ; 39: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 240
	i32 280482487, ; 40: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 237
	i32 280992041, ; 41: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 288
	i32 291076382, ; 42: System.IO.Pipes.AccessControl.dll => 0x1159791e => 53
	i32 298918909, ; 43: System.Net.Ping.dll => 0x11d123fd => 68
	i32 317674968, ; 44: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 316
	i32 318968648, ; 45: Xamarin.AndroidX.Activity.dll => 0x13031348 => 207
	i32 321597661, ; 46: System.Numerics => 0x132b30dd => 82
	i32 336156722, ; 47: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 301
	i32 342366114, ; 48: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 239
	i32 347068432, ; 49: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 197
	i32 356389973, ; 50: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 300
	i32 360082299, ; 51: System.ServiceModel.Web => 0x15766b7b => 130
	i32 367780167, ; 52: System.IO.Pipes => 0x15ebe147 => 54
	i32 374914964, ; 53: System.Transactions.Local => 0x1658bf94 => 146
	i32 375677976, ; 54: System.Net.ServicePoint.dll => 0x16646418 => 73
	i32 379916513, ; 55: System.Threading.Thread.dll => 0x16a510e1 => 142
	i32 385762202, ; 56: System.Memory.dll => 0x16fe439a => 61
	i32 392610295, ; 57: System.Threading.ThreadPool.dll => 0x1766c1f7 => 143
	i32 395744057, ; 58: _Microsoft.Android.Resource.Designer => 0x17969339 => 321
	i32 403441872, ; 59: WindowsBase => 0x180c08d0 => 162
	i32 435591531, ; 60: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 312
	i32 441335492, ; 61: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 222
	i32 442565967, ; 62: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 63: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 235
	i32 451504562, ; 64: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 124
	i32 456227837, ; 65: System.Web.HttpUtility.dll => 0x1b317bfd => 149
	i32 459347974, ; 66: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 112
	i32 465846621, ; 67: mscorlib => 0x1bc4415d => 163
	i32 469710990, ; 68: System.dll => 0x1bff388e => 161
	i32 476646585, ; 69: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 237
	i32 486930444, ; 70: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 250
	i32 498788369, ; 71: System.ObjectModel => 0x1dbae811 => 83
	i32 500358224, ; 72: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 299
	i32 503918385, ; 73: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 293
	i32 513247710, ; 74: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 187
	i32 526420162, ; 75: System.Transactions.dll => 0x1f6088c2 => 147
	i32 527452488, ; 76: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 282
	i32 530272170, ; 77: System.Linq.Queryable => 0x1f9b4faa => 59
	i32 539058512, ; 78: Microsoft.Extensions.Logging => 0x20216150 => 183
	i32 540030774, ; 79: System.IO.FileSystem.dll => 0x20303736 => 50
	i32 545304856, ; 80: System.Runtime.Extensions => 0x2080b118 => 102
	i32 546455878, ; 81: System.Runtime.Serialization.Xml => 0x20924146 => 113
	i32 549171840, ; 82: System.Globalization.Calendars => 0x20bbb280 => 39
	i32 557405415, ; 83: Jsr305Binding => 0x213954e7 => 275
	i32 569601784, ; 84: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 273
	i32 577335427, ; 85: System.Security.Cryptography.Cng => 0x22697083 => 119
	i32 592146354, ; 86: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 307
	i32 601371474, ; 87: System.IO.IsolatedStorage.dll => 0x23d83352 => 51
	i32 605376203, ; 88: System.IO.Compression.FileSystem => 0x24154ecb => 43
	i32 613668793, ; 89: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 118
	i32 627609679, ; 90: Xamarin.AndroidX.CustomView => 0x2568904f => 227
	i32 627931235, ; 91: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 305
	i32 639843206, ; 92: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 233
	i32 643868501, ; 93: System.Net => 0x2660a755 => 80
	i32 662205335, ; 94: System.Text.Encodings.Web.dll => 0x27787397 => 201
	i32 663517072, ; 95: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 269
	i32 666292255, ; 96: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 214
	i32 672442732, ; 97: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 98: System.Net.Security => 0x28bdabca => 72
	i32 688181140, ; 99: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 287
	i32 690569205, ; 100: System.Xml.Linq.dll => 0x29293ff5 => 152
	i32 691348768, ; 101: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 284
	i32 693804605, ; 102: System.Windows => 0x295a9e3d => 151
	i32 699345723, ; 103: System.Reflection.Emit => 0x29af2b3b => 91
	i32 700284507, ; 104: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 279
	i32 700358131, ; 105: System.IO.Compression.ZipFile => 0x29be9df3 => 44
	i32 706645707, ; 106: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 302
	i32 709557578, ; 107: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 290
	i32 720511267, ; 108: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 283
	i32 722857257, ; 109: System.Runtime.Loader.dll => 0x2b15ed29 => 108
	i32 735137430, ; 110: System.Security.SecureString.dll => 0x2bd14e96 => 128
	i32 748832960, ; 111: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 195
	i32 752232764, ; 112: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 113: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 204
	i32 759454413, ; 114: System.Net.Requests => 0x2d445acd => 71
	i32 762598435, ; 115: System.IO.Pipes.dll => 0x2d745423 => 54
	i32 775507847, ; 116: System.IO.Compression => 0x2e394f87 => 45
	i32 777317022, ; 117: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 311
	i32 789151979, ; 118: Microsoft.Extensions.Options => 0x2f0980eb => 186
	i32 790371945, ; 119: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 228
	i32 804715423, ; 120: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 121: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 242
	i32 823281589, ; 122: System.Private.Uri.dll => 0x311247b5 => 85
	i32 830298997, ; 123: System.IO.Compression.Brotli => 0x317d5b75 => 42
	i32 832635846, ; 124: System.Xml.XPath.dll => 0x31a103c6 => 157
	i32 834051424, ; 125: System.Net.Quic => 0x31b69d60 => 70
	i32 843511501, ; 126: Xamarin.AndroidX.Print => 0x3246f6cd => 255
	i32 873119928, ; 127: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 128: System.Globalization.dll => 0x34505120 => 41
	i32 878954865, ; 129: System.Net.Http.Json => 0x3463c971 => 62
	i32 904024072, ; 130: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 131: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 52
	i32 926902833, ; 132: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 314
	i32 928116545, ; 133: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 278
	i32 952186615, ; 134: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 104
	i32 955402788, ; 135: Newtonsoft.Json => 0x38f24a24 => 194
	i32 956575887, ; 136: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 283
	i32 966729478, ; 137: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 276
	i32 967690846, ; 138: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 239
	i32 975236339, ; 139: System.Diagnostics.Tracing => 0x3a20ecf3 => 33
	i32 975874589, ; 140: System.Xml.XDocument => 0x3a2aaa1d => 155
	i32 986514023, ; 141: System.Private.DataContractSerialization.dll => 0x3acd0267 => 84
	i32 987214855, ; 142: System.Diagnostics.Tools => 0x3ad7b407 => 31
	i32 992768348, ; 143: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 144: System.IO.FileSystem => 0x3b45fb35 => 50
	i32 994640506, ; 145: MrMealer => 0x3b49027a => 0
	i32 1001831731, ; 146: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 55
	i32 1012816738, ; 147: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 259
	i32 1019214401, ; 148: System.Drawing => 0x3cbffa41 => 35
	i32 1028951442, ; 149: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 181
	i32 1029334545, ; 150: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 289
	i32 1031528504, ; 151: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 277
	i32 1035644815, ; 152: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 212
	i32 1036536393, ; 153: System.Drawing.Primitives.dll => 0x3dc84a49 => 34
	i32 1044663988, ; 154: System.Linq.Expressions.dll => 0x3e444eb4 => 57
	i32 1052210849, ; 155: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 246
	i32 1067306892, ; 156: GoogleGson => 0x3f9dcf8c => 170
	i32 1082857460, ; 157: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 158: Xamarin.Kotlin.StdLib => 0x409e66d8 => 280
	i32 1098259244, ; 159: System => 0x41761b2c => 161
	i32 1118262833, ; 160: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 302
	i32 1121599056, ; 161: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 245
	i32 1127624469, ; 162: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 185
	i32 1149092582, ; 163: Xamarin.AndroidX.Window => 0x447dc2e6 => 272
	i32 1157931901, ; 164: Microsoft.EntityFrameworkCore.Abstractions => 0x4504a37d => 173
	i32 1168523401, ; 165: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 308
	i32 1170634674, ; 166: System.Web.dll => 0x45c677b2 => 150
	i32 1175144683, ; 167: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 268
	i32 1178241025, ; 168: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 253
	i32 1202000627, ; 169: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x47a512f3 => 173
	i32 1203215381, ; 170: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 306
	i32 1204270330, ; 171: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 214
	i32 1204575371, ; 172: Microsoft.Extensions.Caching.Memory.dll => 0x47cc5c8b => 177
	i32 1208641965, ; 173: System.Diagnostics.Process => 0x480a69ad => 28
	i32 1219128291, ; 174: System.IO.IsolatedStorage => 0x48aa6be3 => 51
	i32 1234928153, ; 175: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 304
	i32 1243150071, ; 176: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 273
	i32 1253011324, ; 177: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 178: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 288
	i32 1264511973, ; 179: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 263
	i32 1267360935, ; 180: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 267
	i32 1273260888, ; 181: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 219
	i32 1275534314, ; 182: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 284
	i32 1278448581, ; 183: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 211
	i32 1292207520, ; 184: SQLitePCLRaw.core.dll => 0x4d0585a0 => 196
	i32 1293217323, ; 185: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 230
	i32 1309188875, ; 186: System.Private.DataContractSerialization => 0x4e08a30b => 84
	i32 1322716291, ; 187: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 272
	i32 1324164729, ; 188: System.Linq => 0x4eed2679 => 60
	i32 1335329327, ; 189: System.Runtime.Serialization.Json.dll => 0x4f97822f => 111
	i32 1364015309, ; 190: System.IO => 0x514d38cd => 56
	i32 1373134921, ; 191: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 318
	i32 1376866003, ; 192: Xamarin.AndroidX.SavedState => 0x52114ed3 => 259
	i32 1379779777, ; 193: System.Resources.ResourceManager => 0x523dc4c1 => 98
	i32 1402170036, ; 194: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 195: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 223
	i32 1408764838, ; 196: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 110
	i32 1411638395, ; 197: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 100
	i32 1422545099, ; 198: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 101
	i32 1430672901, ; 199: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 286
	i32 1434145427, ; 200: System.Runtime.Handles => 0x557b5293 => 103
	i32 1435222561, ; 201: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 276
	i32 1439761251, ; 202: System.Net.Quic.dll => 0x55d10363 => 70
	i32 1452070440, ; 203: System.Formats.Asn1.dll => 0x568cd628 => 37
	i32 1453312822, ; 204: System.Diagnostics.Tools.dll => 0x569fcb36 => 31
	i32 1457743152, ; 205: System.Runtime.Extensions.dll => 0x56e36530 => 102
	i32 1458022317, ; 206: System.Net.Security.dll => 0x56e7a7ad => 72
	i32 1461004990, ; 207: es\Microsoft.Maui.Controls.resources => 0x57152abe => 292
	i32 1461234159, ; 208: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 209: System.Security.Cryptography.OpenSsl => 0x57201017 => 122
	i32 1462112819, ; 210: System.IO.Compression.dll => 0x57261233 => 45
	i32 1469204771, ; 211: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 213
	i32 1470490898, ; 212: Microsoft.Extensions.Primitives => 0x57a5e912 => 187
	i32 1479771757, ; 213: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 214: System.IO.Compression.Brotli.dll => 0x583e844f => 42
	i32 1487239319, ; 215: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 216: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 260
	i32 1490351284, ; 217: Microsoft.Data.Sqlite.dll => 0x58d4f4b4 => 171
	i32 1493001747, ; 218: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 296
	i32 1514721132, ; 219: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 291
	i32 1536373174, ; 220: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 30
	i32 1543031311, ; 221: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 135
	i32 1543355203, ; 222: System.Reflection.Emit.dll => 0x5bfdbb43 => 91
	i32 1550322496, ; 223: System.Reflection.Extensions.dll => 0x5c680b40 => 92
	i32 1551623176, ; 224: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 311
	i32 1565862583, ; 225: System.IO.FileSystem.Primitives => 0x5d552ab7 => 48
	i32 1566207040, ; 226: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 138
	i32 1573704789, ; 227: System.Runtime.Serialization.Json => 0x5dccd455 => 111
	i32 1580037396, ; 228: System.Threading.Overlapped => 0x5e2d7514 => 137
	i32 1582372066, ; 229: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 229
	i32 1592978981, ; 230: System.Runtime.Serialization.dll => 0x5ef2ee25 => 114
	i32 1597949149, ; 231: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 277
	i32 1601112923, ; 232: System.Xml.Serialization => 0x5f6f0b5b => 154
	i32 1604827217, ; 233: System.Net.WebClient => 0x5fa7b851 => 75
	i32 1618516317, ; 234: System.Net.WebSockets.Client.dll => 0x6078995d => 78
	i32 1622152042, ; 235: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 249
	i32 1622358360, ; 236: System.Dynamic.Runtime => 0x60b33958 => 36
	i32 1624863272, ; 237: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 271
	i32 1635184631, ; 238: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 233
	i32 1636350590, ; 239: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 226
	i32 1639515021, ; 240: System.Net.Http.dll => 0x61b9038d => 63
	i32 1639986890, ; 241: System.Text.RegularExpressions => 0x61c036ca => 135
	i32 1641389582, ; 242: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 243: System.Runtime => 0x62c6282e => 115
	i32 1658241508, ; 244: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 265
	i32 1658251792, ; 245: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 274
	i32 1670060433, ; 246: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 221
	i32 1675553242, ; 247: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 47
	i32 1677501392, ; 248: System.Net.Primitives.dll => 0x63fca3d0 => 69
	i32 1678508291, ; 249: System.Net.WebSockets => 0x640c0103 => 79
	i32 1679769178, ; 250: System.Security.Cryptography => 0x641f3e5a => 125
	i32 1688112883, ; 251: Microsoft.Data.Sqlite => 0x649e8ef3 => 171
	i32 1689493916, ; 252: Microsoft.EntityFrameworkCore.dll => 0x64b3a19c => 172
	i32 1691477237, ; 253: System.Reflection.Metadata => 0x64d1e4f5 => 93
	i32 1696967625, ; 254: System.Security.Cryptography.Csp => 0x6525abc9 => 120
	i32 1698840827, ; 255: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 281
	i32 1701541528, ; 256: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1711441057, ; 257: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 197
	i32 1720223769, ; 258: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 242
	i32 1726116996, ; 259: System.Reflection.dll => 0x66e27484 => 96
	i32 1728033016, ; 260: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 27
	i32 1729485958, ; 261: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 217
	i32 1736233607, ; 262: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 309
	i32 1743415430, ; 263: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 287
	i32 1744735666, ; 264: System.Transactions.Local.dll => 0x67fe8db2 => 146
	i32 1746115085, ; 265: System.IO.Pipelines.dll => 0x68139a0d => 200
	i32 1746316138, ; 266: Mono.Android.Export => 0x6816ab6a => 166
	i32 1750313021, ; 267: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 268: System.Resources.Reader.dll => 0x68cc9d1e => 97
	i32 1763938596, ; 269: System.Diagnostics.TraceSource.dll => 0x69239124 => 32
	i32 1765942094, ; 270: System.Reflection.Extensions => 0x6942234e => 92
	i32 1766324549, ; 271: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 264
	i32 1770582343, ; 272: Microsoft.Extensions.Logging.dll => 0x6988f147 => 183
	i32 1776026572, ; 273: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 274: System.Globalization.Extensions.dll => 0x69ec0683 => 40
	i32 1780572499, ; 275: Mono.Android.Runtime.dll => 0x6a216153 => 167
	i32 1782862114, ; 276: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 303
	i32 1788241197, ; 277: Xamarin.AndroidX.Fragment => 0x6a96652d => 235
	i32 1793755602, ; 278: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 295
	i32 1808609942, ; 279: Xamarin.AndroidX.Loader => 0x6bcd3296 => 249
	i32 1813058853, ; 280: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 280
	i32 1813201214, ; 281: Xamarin.Google.Android.Material => 0x6c13413e => 274
	i32 1818569960, ; 282: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 254
	i32 1818787751, ; 283: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 284: System.Text.Encoding.Extensions => 0x6cbab720 => 133
	i32 1824722060, ; 285: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 110
	i32 1828688058, ; 286: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 184
	i32 1842015223, ; 287: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 315
	i32 1847515442, ; 288: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 204
	i32 1853025655, ; 289: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 312
	i32 1858542181, ; 290: System.Linq.Expressions => 0x6ec71a65 => 57
	i32 1870277092, ; 291: System.Reflection.Primitives => 0x6f7a29e4 => 94
	i32 1875935024, ; 292: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 294
	i32 1879696579, ; 293: System.Formats.Tar.dll => 0x7009e4c3 => 38
	i32 1885316902, ; 294: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 215
	i32 1886040351, ; 295: Microsoft.EntityFrameworkCore.Sqlite.dll => 0x706ab11f => 175
	i32 1888955245, ; 296: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 297: System.Reflection.Metadata.dll => 0x70a66bdd => 93
	i32 1898237753, ; 298: System.Reflection.DispatchProxy => 0x7124cf39 => 88
	i32 1900610850, ; 299: System.Resources.ResourceManager.dll => 0x71490522 => 98
	i32 1910275211, ; 300: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 301: System.Private.Xml.Linq => 0x739bd4a8 => 86
	i32 1956758971, ; 302: System.Resources.Writer => 0x74a1c5bb => 99
	i32 1961813231, ; 303: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 261
	i32 1968388702, ; 304: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 178
	i32 1983156543, ; 305: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 281
	i32 1985761444, ; 306: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 206
	i32 2003115576, ; 307: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 291
	i32 2011961780, ; 308: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2014489277, ; 309: Microsoft.EntityFrameworkCore.Sqlite => 0x7812aabd => 175
	i32 2019465201, ; 310: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 246
	i32 2025202353, ; 311: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 286
	i32 2031763787, ; 312: Xamarin.Android.Glide => 0x791a414b => 203
	i32 2045470958, ; 313: System.Private.Xml => 0x79eb68ee => 87
	i32 2055257422, ; 314: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 241
	i32 2060060697, ; 315: System.Windows.dll => 0x7aca0819 => 151
	i32 2066184531, ; 316: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 290
	i32 2070888862, ; 317: System.Diagnostics.TraceSource => 0x7b6f419e => 32
	i32 2079903147, ; 318: System.Runtime.dll => 0x7bf8cdab => 115
	i32 2090596640, ; 319: System.Numerics.Vectors => 0x7c9bf920 => 81
	i32 2103459038, ; 320: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 198
	i32 2127167465, ; 321: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 322: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 323: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 159
	i32 2146852085, ; 324: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 325: Microsoft.Maui => 0x80bd55ad => 191
	i32 2169148018, ; 326: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 298
	i32 2181898931, ; 327: Microsoft.Extensions.Options.dll => 0x820d22b3 => 186
	i32 2192057212, ; 328: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 184
	i32 2193016926, ; 329: System.ObjectModel.dll => 0x82b6c85e => 83
	i32 2197979891, ; 330: Microsoft.Extensions.DependencyModel.dll => 0x830282f3 => 182
	i32 2201107256, ; 331: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 285
	i32 2201231467, ; 332: System.Net.Http => 0x8334206b => 63
	i32 2207618523, ; 333: it\Microsoft.Maui.Controls.resources => 0x839595db => 300
	i32 2217644978, ; 334: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 268
	i32 2222056684, ; 335: System.Threading.Tasks.Parallel => 0x8471e4ec => 140
	i32 2244775296, ; 336: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 250
	i32 2252106437, ; 337: System.Xml.Serialization.dll => 0x863c6ac5 => 154
	i32 2252897993, ; 338: Microsoft.EntityFrameworkCore => 0x86487ec9 => 172
	i32 2256313426, ; 339: System.Globalization.Extensions => 0x867c9c52 => 40
	i32 2265110946, ; 340: System.Security.AccessControl.dll => 0x8702d9a2 => 116
	i32 2266799131, ; 341: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 179
	i32 2267999099, ; 342: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 205
	i32 2270573516, ; 343: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 294
	i32 2279755925, ; 344: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 257
	i32 2293034957, ; 345: System.ServiceModel.Web.dll => 0x88acefcd => 130
	i32 2295906218, ; 346: System.Net.Sockets => 0x88d8bfaa => 74
	i32 2298471582, ; 347: System.Net.Mail => 0x88ffe49e => 65
	i32 2303942373, ; 348: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 304
	i32 2305521784, ; 349: System.Private.CoreLib.dll => 0x896b7878 => 169
	i32 2315684594, ; 350: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 209
	i32 2320631194, ; 351: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 140
	i32 2340441535, ; 352: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 105
	i32 2344264397, ; 353: System.ValueTuple => 0x8bbaa2cd => 148
	i32 2353062107, ; 354: System.Net.Primitives => 0x8c40e0db => 69
	i32 2368005991, ; 355: System.Xml.ReaderWriter.dll => 0x8d24e767 => 153
	i32 2371007202, ; 356: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 178
	i32 2378619854, ; 357: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 120
	i32 2383496789, ; 358: System.Security.Principal.Windows.dll => 0x8e114655 => 126
	i32 2395872292, ; 359: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 299
	i32 2401565422, ; 360: System.Web.HttpUtility => 0x8f24faee => 149
	i32 2403452196, ; 361: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 232
	i32 2421380589, ; 362: System.Threading.Tasks.Dataflow => 0x905355ed => 138
	i32 2423080555, ; 363: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 219
	i32 2427813419, ; 364: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 296
	i32 2435356389, ; 365: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 366: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 367: System.Text.Encoding.dll => 0x924edee6 => 134
	i32 2458678730, ; 368: System.Net.Sockets.dll => 0x928c75ca => 74
	i32 2459001652, ; 369: System.Linq.Parallel.dll => 0x92916334 => 58
	i32 2465273461, ; 370: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 195
	i32 2465532216, ; 371: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 222
	i32 2471841756, ; 372: netstandard.dll => 0x93554fdc => 164
	i32 2475788418, ; 373: Java.Interop.dll => 0x93918882 => 165
	i32 2480646305, ; 374: Microsoft.Maui.Controls => 0x93dba8a1 => 189
	i32 2483903535, ; 375: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 376: System.Net.ServicePoint => 0x94147f61 => 73
	i32 2490993605, ; 377: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 378: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 379: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 244
	i32 2522472828, ; 380: Xamarin.Android.Glide.dll => 0x9659e17c => 203
	i32 2538310050, ; 381: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 90
	i32 2550873716, ; 382: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 297
	i32 2562349572, ; 383: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 384: System.Text.Encodings.Web => 0x9930ee42 => 201
	i32 2581783588, ; 385: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 245
	i32 2581819634, ; 386: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 267
	i32 2585220780, ; 387: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 133
	i32 2585805581, ; 388: System.Net.Ping => 0x9a20430d => 68
	i32 2589602615, ; 389: System.Threading.ThreadPool => 0x9a5a3337 => 143
	i32 2593496499, ; 390: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 306
	i32 2605712449, ; 391: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 285
	i32 2615233544, ; 392: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 236
	i32 2616218305, ; 393: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 185
	i32 2617129537, ; 394: System.Private.Xml.dll => 0x9bfe3a41 => 87
	i32 2618712057, ; 395: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 95
	i32 2620871830, ; 396: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 226
	i32 2624644809, ; 397: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 231
	i32 2626831493, ; 398: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 301
	i32 2627185994, ; 399: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 30
	i32 2629843544, ; 400: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 44
	i32 2633051222, ; 401: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 240
	i32 2634653062, ; 402: Microsoft.EntityFrameworkCore.Relational.dll => 0x9d099d86 => 174
	i32 2663391936, ; 403: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 205
	i32 2663698177, ; 404: System.Runtime.Loader => 0x9ec4cf01 => 108
	i32 2664396074, ; 405: System.Xml.XDocument.dll => 0x9ecf752a => 155
	i32 2665622720, ; 406: System.Drawing.Primitives => 0x9ee22cc0 => 34
	i32 2676780864, ; 407: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 408: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 113
	i32 2693849962, ; 409: System.IO.dll => 0xa090e36a => 56
	i32 2701096212, ; 410: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 265
	i32 2715334215, ; 411: System.Threading.Tasks.dll => 0xa1d8b647 => 141
	i32 2717744543, ; 412: System.Security.Claims => 0xa1fd7d9f => 117
	i32 2719963679, ; 413: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 119
	i32 2724373263, ; 414: System.Runtime.Numerics.dll => 0xa262a30f => 109
	i32 2732626843, ; 415: Xamarin.AndroidX.Activity => 0xa2e0939b => 207
	i32 2735172069, ; 416: System.Threading.Channels => 0xa30769e5 => 136
	i32 2737747696, ; 417: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 213
	i32 2740948882, ; 418: System.IO.Pipes.AccessControl => 0xa35f8f92 => 53
	i32 2748088231, ; 419: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 104
	i32 2752995522, ; 420: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 307
	i32 2758225723, ; 421: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 190
	i32 2764765095, ; 422: Microsoft.Maui.dll => 0xa4caf7a7 => 191
	i32 2765824710, ; 423: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 132
	i32 2770495804, ; 424: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 279
	i32 2778768386, ; 425: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 270
	i32 2779977773, ; 426: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 258
	i32 2781477104, ; 427: MrMealer.dll => 0xa5c9f8f0 => 0
	i32 2785988530, ; 428: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 313
	i32 2788224221, ; 429: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 236
	i32 2801831435, ; 430: Microsoft.Maui.Graphics => 0xa7008e0b => 193
	i32 2803228030, ; 431: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 156
	i32 2806116107, ; 432: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 292
	i32 2810250172, ; 433: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 223
	i32 2819470561, ; 434: System.Xml.dll => 0xa80db4e1 => 160
	i32 2821205001, ; 435: System.ServiceProcess.dll => 0xa8282c09 => 131
	i32 2821294376, ; 436: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 258
	i32 2824502124, ; 437: System.Xml.XmlDocument => 0xa85a7b6c => 158
	i32 2831556043, ; 438: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 305
	i32 2838993487, ; 439: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 247
	i32 2847789619, ; 440: Microsoft.EntityFrameworkCore.Relational => 0xa9bdd233 => 174
	i32 2849599387, ; 441: System.Threading.Overlapped.dll => 0xa9d96f9b => 137
	i32 2853208004, ; 442: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 270
	i32 2855708567, ; 443: Xamarin.AndroidX.Transition => 0xaa36a797 => 266
	i32 2861098320, ; 444: Mono.Android.Export.dll => 0xaa88e550 => 166
	i32 2861189240, ; 445: Microsoft.Maui.Essentials => 0xaa8a4878 => 192
	i32 2870099610, ; 446: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 208
	i32 2875164099, ; 447: Jsr305Binding.dll => 0xab5f85c3 => 275
	i32 2875220617, ; 448: System.Globalization.Calendars.dll => 0xab606289 => 39
	i32 2884993177, ; 449: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 234
	i32 2887636118, ; 450: System.Net.dll => 0xac1dd496 => 80
	i32 2899753641, ; 451: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 55
	i32 2900621748, ; 452: System.Dynamic.Runtime.dll => 0xace3f9b4 => 36
	i32 2901442782, ; 453: System.Reflection => 0xacf080de => 96
	i32 2905242038, ; 454: mscorlib.dll => 0xad2a79b6 => 163
	i32 2909740682, ; 455: System.Private.CoreLib => 0xad6f1e8a => 169
	i32 2916838712, ; 456: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 271
	i32 2919462931, ; 457: System.Numerics.Vectors.dll => 0xae037813 => 81
	i32 2921128767, ; 458: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 210
	i32 2936416060, ; 459: System.Resources.Reader => 0xaf06273c => 97
	i32 2940926066, ; 460: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 29
	i32 2942453041, ; 461: System.Xml.XPath.XDocument => 0xaf624531 => 156
	i32 2959614098, ; 462: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 463: System.Security.Principal.Windows => 0xb0ed41f3 => 126
	i32 2972252294, ; 464: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 118
	i32 2978675010, ; 465: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 230
	i32 2987532451, ; 466: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 261
	i32 2996846495, ; 467: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 243
	i32 3016983068, ; 468: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 263
	i32 3023353419, ; 469: WindowsBase.dll => 0xb434b64b => 162
	i32 3024354802, ; 470: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 238
	i32 3038032645, ; 471: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 321
	i32 3056245963, ; 472: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 260
	i32 3057625584, ; 473: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 251
	i32 3059408633, ; 474: Mono.Android.Runtime => 0xb65adef9 => 167
	i32 3059793426, ; 475: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3069363400, ; 476: Microsoft.Extensions.Caching.Abstractions.dll => 0xb6f2c4c8 => 176
	i32 3075834255, ; 477: System.Threading.Tasks => 0xb755818f => 141
	i32 3077302341, ; 478: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 298
	i32 3090735792, ; 479: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 124
	i32 3099732863, ; 480: System.Security.Claims.dll => 0xb8c22b7f => 117
	i32 3103600923, ; 481: System.Formats.Asn1 => 0xb8fd311b => 37
	i32 3111772706, ; 482: System.Runtime.Serialization => 0xb979e222 => 114
	i32 3121463068, ; 483: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 46
	i32 3124832203, ; 484: System.Threading.Tasks.Extensions => 0xba4127cb => 139
	i32 3132293585, ; 485: System.Security.AccessControl => 0xbab301d1 => 116
	i32 3147165239, ; 486: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 33
	i32 3148237826, ; 487: GoogleGson.dll => 0xbba64c02 => 170
	i32 3159123045, ; 488: System.Reflection.Primitives.dll => 0xbc4c6465 => 94
	i32 3160747431, ; 489: System.IO.MemoryMappedFiles => 0xbc652da7 => 52
	i32 3178803400, ; 490: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 252
	i32 3192346100, ; 491: System.Security.SecureString => 0xbe4755f4 => 128
	i32 3193515020, ; 492: System.Web => 0xbe592c0c => 150
	i32 3195844289, ; 493: Microsoft.Extensions.Caching.Abstractions => 0xbe7cb6c1 => 176
	i32 3204380047, ; 494: System.Data.dll => 0xbefef58f => 24
	i32 3207841594, ; 495: MrMealer.Database.dll => 0xbf33c73a => 320
	i32 3209718065, ; 496: System.Xml.XmlDocument.dll => 0xbf506931 => 158
	i32 3211777861, ; 497: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 229
	i32 3220365878, ; 498: System.Threading => 0xbff2e236 => 145
	i32 3226221578, ; 499: System.Runtime.Handles.dll => 0xc04c3c0a => 103
	i32 3251039220, ; 500: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 88
	i32 3258312781, ; 501: Xamarin.AndroidX.CardView => 0xc235e84d => 217
	i32 3265493905, ; 502: System.Linq.Queryable.dll => 0xc2a37b91 => 59
	i32 3265893370, ; 503: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 139
	i32 3277815716, ; 504: System.Resources.Writer.dll => 0xc35f7fa4 => 99
	i32 3279906254, ; 505: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 506: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 507: System.Security.Cryptography.Encoding => 0xc4251ff9 => 121
	i32 3299363146, ; 508: System.Text.Encoding => 0xc4a8494a => 134
	i32 3303498502, ; 509: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 27
	i32 3305363605, ; 510: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 293
	i32 3316684772, ; 511: System.Net.Requests.dll => 0xc5b097e4 => 71
	i32 3317135071, ; 512: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 227
	i32 3317144872, ; 513: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 514: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 215
	i32 3345895724, ; 515: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 256
	i32 3346324047, ; 516: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 253
	i32 3357674450, ; 517: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 310
	i32 3358260929, ; 518: System.Text.Json => 0xc82afec1 => 202
	i32 3360279109, ; 519: SQLitePCLRaw.core => 0xc849ca45 => 196
	i32 3362336904, ; 520: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 208
	i32 3362522851, ; 521: Xamarin.AndroidX.Core => 0xc86c06e3 => 224
	i32 3366347497, ; 522: Java.Interop => 0xc8a662e9 => 165
	i32 3374999561, ; 523: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 257
	i32 3381016424, ; 524: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 289
	i32 3395150330, ; 525: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 100
	i32 3403906625, ; 526: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 122
	i32 3405233483, ; 527: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 228
	i32 3428513518, ; 528: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 180
	i32 3429136800, ; 529: System.Xml => 0xcc6479a0 => 160
	i32 3430777524, ; 530: netstandard => 0xcc7d82b4 => 164
	i32 3441283291, ; 531: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 231
	i32 3445260447, ; 532: System.Formats.Tar => 0xcd5a809f => 38
	i32 3452344032, ; 533: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 188
	i32 3463511458, ; 534: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 297
	i32 3471940407, ; 535: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 536: Mono.Android => 0xcf3163e6 => 168
	i32 3479583265, ; 537: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 310
	i32 3484440000, ; 538: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 309
	i32 3485117614, ; 539: System.Text.Json.dll => 0xcfbaacae => 202
	i32 3486566296, ; 540: System.Transactions => 0xcfd0c798 => 147
	i32 3493954962, ; 541: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 220
	i32 3509114376, ; 542: System.Xml.Linq => 0xd128d608 => 152
	i32 3515174580, ; 543: System.Security.dll => 0xd1854eb4 => 129
	i32 3530912306, ; 544: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 545: System.Net.HttpListener => 0xd2ff69f1 => 64
	i32 3560100363, ; 546: System.Threading.Timer => 0xd432d20b => 144
	i32 3570554715, ; 547: System.IO.FileSystem.AccessControl => 0xd4d2575b => 46
	i32 3580758918, ; 548: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 317
	i32 3597029428, ; 549: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 206
	i32 3598340787, ; 550: System.Net.WebSockets.Client => 0xd67a52b3 => 78
	i32 3608519521, ; 551: System.Linq.dll => 0xd715a361 => 60
	i32 3624195450, ; 552: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 105
	i32 3627220390, ; 553: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 255
	i32 3633644679, ; 554: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 210
	i32 3638274909, ; 555: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 48
	i32 3641597786, ; 556: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 241
	i32 3643446276, ; 557: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 314
	i32 3643854240, ; 558: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 252
	i32 3645089577, ; 559: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 560: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 179
	i32 3660523487, ; 561: System.Net.NetworkInformation => 0xda2f27df => 67
	i32 3672681054, ; 562: Mono.Android.dll => 0xdae8aa5e => 168
	i32 3682565725, ; 563: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 216
	i32 3684561358, ; 564: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 220
	i32 3697841164, ; 565: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 319
	i32 3700866549, ; 566: System.Net.WebProxy.dll => 0xdc96bdf5 => 77
	i32 3706696989, ; 567: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 225
	i32 3716563718, ; 568: System.Runtime.Intrinsics => 0xdd864306 => 107
	i32 3718780102, ; 569: Xamarin.AndroidX.Annotation => 0xdda814c6 => 209
	i32 3724971120, ; 570: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 251
	i32 3732100267, ; 571: System.Net.NameResolution => 0xde7354ab => 66
	i32 3737834244, ; 572: System.Net.Http.Json.dll => 0xdecad304 => 62
	i32 3748608112, ; 573: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 199
	i32 3751444290, ; 574: System.Xml.XPath => 0xdf9a7f42 => 157
	i32 3754567612, ; 575: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 198
	i32 3786282454, ; 576: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 218
	i32 3792276235, ; 577: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 578: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 188
	i32 3802395368, ; 579: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 580: System.Net.WebProxy => 0xe3a54a09 => 77
	i32 3823082795, ; 581: System.Security.Cryptography.dll => 0xe3df9d2b => 125
	i32 3829621856, ; 582: System.Numerics.dll => 0xe4436460 => 82
	i32 3841636137, ; 583: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 181
	i32 3844307129, ; 584: System.Net.Mail.dll => 0xe52378b9 => 65
	i32 3849253459, ; 585: System.Runtime.InteropServices.dll => 0xe56ef253 => 106
	i32 3870376305, ; 586: System.Net.HttpListener.dll => 0xe6b14171 => 64
	i32 3873536506, ; 587: System.Security.Principal => 0xe6e179fa => 127
	i32 3875112723, ; 588: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 121
	i32 3885497537, ; 589: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 76
	i32 3885922214, ; 590: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 266
	i32 3888767677, ; 591: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 256
	i32 3889960447, ; 592: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 318
	i32 3896106733, ; 593: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 594: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 224
	i32 3901907137, ; 595: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 596: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 43
	i32 3921031405, ; 597: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 269
	i32 3922226020, ; 598: MrMealer.Database => 0xe9c86b64 => 320
	i32 3928044579, ; 599: System.Xml.ReaderWriter => 0xea213423 => 153
	i32 3930554604, ; 600: System.Security.Principal.dll => 0xea4780ec => 127
	i32 3931092270, ; 601: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 254
	i32 3945713374, ; 602: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 603: System.Text.Encoding.CodePages => 0xebac8bfe => 132
	i32 3955647286, ; 604: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 212
	i32 3959773229, ; 605: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 243
	i32 3980434154, ; 606: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 313
	i32 3987592930, ; 607: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 295
	i32 4003436829, ; 608: System.Diagnostics.Process.dll => 0xee9f991d => 28
	i32 4015948917, ; 609: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 211
	i32 4023392905, ; 610: System.IO.Pipelines => 0xefd01a89 => 200
	i32 4025784931, ; 611: System.Memory => 0xeff49a63 => 61
	i32 4046471985, ; 612: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 190
	i32 4054681211, ; 613: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 89
	i32 4068434129, ; 614: System.Private.Xml.Linq.dll => 0xf27f60d1 => 86
	i32 4073602200, ; 615: System.Threading.dll => 0xf2ce3c98 => 145
	i32 4094352644, ; 616: Microsoft.Maui.Essentials.dll => 0xf40add04 => 192
	i32 4099507663, ; 617: System.Drawing.dll => 0xf45985cf => 35
	i32 4100113165, ; 618: System.Private.Uri => 0xf462c30d => 85
	i32 4101593132, ; 619: Xamarin.AndroidX.Emoji2 => 0xf479582c => 232
	i32 4101842092, ; 620: Microsoft.Extensions.Caching.Memory => 0xf47d24ac => 177
	i32 4102112229, ; 621: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 308
	i32 4125707920, ; 622: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 303
	i32 4126470640, ; 623: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 180
	i32 4127667938, ; 624: System.IO.FileSystem.Watcher => 0xf60736e2 => 49
	i32 4130442656, ; 625: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 626: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 89
	i32 4150914736, ; 627: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 315
	i32 4151237749, ; 628: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 629: System.Xml.XmlSerializer => 0xf7e95c85 => 159
	i32 4161255271, ; 630: System.Reflection.TypeExtensions => 0xf807b767 => 95
	i32 4164802419, ; 631: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 49
	i32 4181436372, ; 632: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 112
	i32 4182413190, ; 633: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 248
	i32 4185676441, ; 634: System.Security => 0xf97c5a99 => 129
	i32 4196529839, ; 635: System.Net.WebClient.dll => 0xfa21f6af => 75
	i32 4213026141, ; 636: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 199
	i32 4256097574, ; 637: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 225
	i32 4258378803, ; 638: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 247
	i32 4260525087, ; 639: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 640: Microsoft.Maui.Controls.dll => 0xfea12dee => 189
	i32 4274976490, ; 641: System.Runtime.Numerics => 0xfecef6ea => 109
	i32 4292120959, ; 642: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 248
	i32 4294763496 ; 643: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 234
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [644 x i32] [
	i32 67, ; 0
	i32 66, ; 1
	i32 107, ; 2
	i32 182, ; 3
	i32 244, ; 4
	i32 278, ; 5
	i32 47, ; 6
	i32 194, ; 7
	i32 79, ; 8
	i32 142, ; 9
	i32 29, ; 10
	i32 319, ; 11
	i32 123, ; 12
	i32 193, ; 13
	i32 101, ; 14
	i32 262, ; 15
	i32 106, ; 16
	i32 262, ; 17
	i32 136, ; 18
	i32 282, ; 19
	i32 76, ; 20
	i32 123, ; 21
	i32 13, ; 22
	i32 218, ; 23
	i32 131, ; 24
	i32 264, ; 25
	i32 148, ; 26
	i32 316, ; 27
	i32 317, ; 28
	i32 18, ; 29
	i32 216, ; 30
	i32 26, ; 31
	i32 238, ; 32
	i32 1, ; 33
	i32 58, ; 34
	i32 41, ; 35
	i32 90, ; 36
	i32 221, ; 37
	i32 144, ; 38
	i32 240, ; 39
	i32 237, ; 40
	i32 288, ; 41
	i32 53, ; 42
	i32 68, ; 43
	i32 316, ; 44
	i32 207, ; 45
	i32 82, ; 46
	i32 301, ; 47
	i32 239, ; 48
	i32 197, ; 49
	i32 300, ; 50
	i32 130, ; 51
	i32 54, ; 52
	i32 146, ; 53
	i32 73, ; 54
	i32 142, ; 55
	i32 61, ; 56
	i32 143, ; 57
	i32 321, ; 58
	i32 162, ; 59
	i32 312, ; 60
	i32 222, ; 61
	i32 12, ; 62
	i32 235, ; 63
	i32 124, ; 64
	i32 149, ; 65
	i32 112, ; 66
	i32 163, ; 67
	i32 161, ; 68
	i32 237, ; 69
	i32 250, ; 70
	i32 83, ; 71
	i32 299, ; 72
	i32 293, ; 73
	i32 187, ; 74
	i32 147, ; 75
	i32 282, ; 76
	i32 59, ; 77
	i32 183, ; 78
	i32 50, ; 79
	i32 102, ; 80
	i32 113, ; 81
	i32 39, ; 82
	i32 275, ; 83
	i32 273, ; 84
	i32 119, ; 85
	i32 307, ; 86
	i32 51, ; 87
	i32 43, ; 88
	i32 118, ; 89
	i32 227, ; 90
	i32 305, ; 91
	i32 233, ; 92
	i32 80, ; 93
	i32 201, ; 94
	i32 269, ; 95
	i32 214, ; 96
	i32 8, ; 97
	i32 72, ; 98
	i32 287, ; 99
	i32 152, ; 100
	i32 284, ; 101
	i32 151, ; 102
	i32 91, ; 103
	i32 279, ; 104
	i32 44, ; 105
	i32 302, ; 106
	i32 290, ; 107
	i32 283, ; 108
	i32 108, ; 109
	i32 128, ; 110
	i32 195, ; 111
	i32 25, ; 112
	i32 204, ; 113
	i32 71, ; 114
	i32 54, ; 115
	i32 45, ; 116
	i32 311, ; 117
	i32 186, ; 118
	i32 228, ; 119
	i32 22, ; 120
	i32 242, ; 121
	i32 85, ; 122
	i32 42, ; 123
	i32 157, ; 124
	i32 70, ; 125
	i32 255, ; 126
	i32 3, ; 127
	i32 41, ; 128
	i32 62, ; 129
	i32 16, ; 130
	i32 52, ; 131
	i32 314, ; 132
	i32 278, ; 133
	i32 104, ; 134
	i32 194, ; 135
	i32 283, ; 136
	i32 276, ; 137
	i32 239, ; 138
	i32 33, ; 139
	i32 155, ; 140
	i32 84, ; 141
	i32 31, ; 142
	i32 12, ; 143
	i32 50, ; 144
	i32 0, ; 145
	i32 55, ; 146
	i32 259, ; 147
	i32 35, ; 148
	i32 181, ; 149
	i32 289, ; 150
	i32 277, ; 151
	i32 212, ; 152
	i32 34, ; 153
	i32 57, ; 154
	i32 246, ; 155
	i32 170, ; 156
	i32 17, ; 157
	i32 280, ; 158
	i32 161, ; 159
	i32 302, ; 160
	i32 245, ; 161
	i32 185, ; 162
	i32 272, ; 163
	i32 173, ; 164
	i32 308, ; 165
	i32 150, ; 166
	i32 268, ; 167
	i32 253, ; 168
	i32 173, ; 169
	i32 306, ; 170
	i32 214, ; 171
	i32 177, ; 172
	i32 28, ; 173
	i32 51, ; 174
	i32 304, ; 175
	i32 273, ; 176
	i32 5, ; 177
	i32 288, ; 178
	i32 263, ; 179
	i32 267, ; 180
	i32 219, ; 181
	i32 284, ; 182
	i32 211, ; 183
	i32 196, ; 184
	i32 230, ; 185
	i32 84, ; 186
	i32 272, ; 187
	i32 60, ; 188
	i32 111, ; 189
	i32 56, ; 190
	i32 318, ; 191
	i32 259, ; 192
	i32 98, ; 193
	i32 19, ; 194
	i32 223, ; 195
	i32 110, ; 196
	i32 100, ; 197
	i32 101, ; 198
	i32 286, ; 199
	i32 103, ; 200
	i32 276, ; 201
	i32 70, ; 202
	i32 37, ; 203
	i32 31, ; 204
	i32 102, ; 205
	i32 72, ; 206
	i32 292, ; 207
	i32 9, ; 208
	i32 122, ; 209
	i32 45, ; 210
	i32 213, ; 211
	i32 187, ; 212
	i32 9, ; 213
	i32 42, ; 214
	i32 4, ; 215
	i32 260, ; 216
	i32 171, ; 217
	i32 296, ; 218
	i32 291, ; 219
	i32 30, ; 220
	i32 135, ; 221
	i32 91, ; 222
	i32 92, ; 223
	i32 311, ; 224
	i32 48, ; 225
	i32 138, ; 226
	i32 111, ; 227
	i32 137, ; 228
	i32 229, ; 229
	i32 114, ; 230
	i32 277, ; 231
	i32 154, ; 232
	i32 75, ; 233
	i32 78, ; 234
	i32 249, ; 235
	i32 36, ; 236
	i32 271, ; 237
	i32 233, ; 238
	i32 226, ; 239
	i32 63, ; 240
	i32 135, ; 241
	i32 15, ; 242
	i32 115, ; 243
	i32 265, ; 244
	i32 274, ; 245
	i32 221, ; 246
	i32 47, ; 247
	i32 69, ; 248
	i32 79, ; 249
	i32 125, ; 250
	i32 171, ; 251
	i32 172, ; 252
	i32 93, ; 253
	i32 120, ; 254
	i32 281, ; 255
	i32 26, ; 256
	i32 197, ; 257
	i32 242, ; 258
	i32 96, ; 259
	i32 27, ; 260
	i32 217, ; 261
	i32 309, ; 262
	i32 287, ; 263
	i32 146, ; 264
	i32 200, ; 265
	i32 166, ; 266
	i32 4, ; 267
	i32 97, ; 268
	i32 32, ; 269
	i32 92, ; 270
	i32 264, ; 271
	i32 183, ; 272
	i32 21, ; 273
	i32 40, ; 274
	i32 167, ; 275
	i32 303, ; 276
	i32 235, ; 277
	i32 295, ; 278
	i32 249, ; 279
	i32 280, ; 280
	i32 274, ; 281
	i32 254, ; 282
	i32 2, ; 283
	i32 133, ; 284
	i32 110, ; 285
	i32 184, ; 286
	i32 315, ; 287
	i32 204, ; 288
	i32 312, ; 289
	i32 57, ; 290
	i32 94, ; 291
	i32 294, ; 292
	i32 38, ; 293
	i32 215, ; 294
	i32 175, ; 295
	i32 25, ; 296
	i32 93, ; 297
	i32 88, ; 298
	i32 98, ; 299
	i32 10, ; 300
	i32 86, ; 301
	i32 99, ; 302
	i32 261, ; 303
	i32 178, ; 304
	i32 281, ; 305
	i32 206, ; 306
	i32 291, ; 307
	i32 7, ; 308
	i32 175, ; 309
	i32 246, ; 310
	i32 286, ; 311
	i32 203, ; 312
	i32 87, ; 313
	i32 241, ; 314
	i32 151, ; 315
	i32 290, ; 316
	i32 32, ; 317
	i32 115, ; 318
	i32 81, ; 319
	i32 198, ; 320
	i32 20, ; 321
	i32 11, ; 322
	i32 159, ; 323
	i32 3, ; 324
	i32 191, ; 325
	i32 298, ; 326
	i32 186, ; 327
	i32 184, ; 328
	i32 83, ; 329
	i32 182, ; 330
	i32 285, ; 331
	i32 63, ; 332
	i32 300, ; 333
	i32 268, ; 334
	i32 140, ; 335
	i32 250, ; 336
	i32 154, ; 337
	i32 172, ; 338
	i32 40, ; 339
	i32 116, ; 340
	i32 179, ; 341
	i32 205, ; 342
	i32 294, ; 343
	i32 257, ; 344
	i32 130, ; 345
	i32 74, ; 346
	i32 65, ; 347
	i32 304, ; 348
	i32 169, ; 349
	i32 209, ; 350
	i32 140, ; 351
	i32 105, ; 352
	i32 148, ; 353
	i32 69, ; 354
	i32 153, ; 355
	i32 178, ; 356
	i32 120, ; 357
	i32 126, ; 358
	i32 299, ; 359
	i32 149, ; 360
	i32 232, ; 361
	i32 138, ; 362
	i32 219, ; 363
	i32 296, ; 364
	i32 20, ; 365
	i32 14, ; 366
	i32 134, ; 367
	i32 74, ; 368
	i32 58, ; 369
	i32 195, ; 370
	i32 222, ; 371
	i32 164, ; 372
	i32 165, ; 373
	i32 189, ; 374
	i32 15, ; 375
	i32 73, ; 376
	i32 6, ; 377
	i32 23, ; 378
	i32 244, ; 379
	i32 203, ; 380
	i32 90, ; 381
	i32 297, ; 382
	i32 1, ; 383
	i32 201, ; 384
	i32 245, ; 385
	i32 267, ; 386
	i32 133, ; 387
	i32 68, ; 388
	i32 143, ; 389
	i32 306, ; 390
	i32 285, ; 391
	i32 236, ; 392
	i32 185, ; 393
	i32 87, ; 394
	i32 95, ; 395
	i32 226, ; 396
	i32 231, ; 397
	i32 301, ; 398
	i32 30, ; 399
	i32 44, ; 400
	i32 240, ; 401
	i32 174, ; 402
	i32 205, ; 403
	i32 108, ; 404
	i32 155, ; 405
	i32 34, ; 406
	i32 22, ; 407
	i32 113, ; 408
	i32 56, ; 409
	i32 265, ; 410
	i32 141, ; 411
	i32 117, ; 412
	i32 119, ; 413
	i32 109, ; 414
	i32 207, ; 415
	i32 136, ; 416
	i32 213, ; 417
	i32 53, ; 418
	i32 104, ; 419
	i32 307, ; 420
	i32 190, ; 421
	i32 191, ; 422
	i32 132, ; 423
	i32 279, ; 424
	i32 270, ; 425
	i32 258, ; 426
	i32 0, ; 427
	i32 313, ; 428
	i32 236, ; 429
	i32 193, ; 430
	i32 156, ; 431
	i32 292, ; 432
	i32 223, ; 433
	i32 160, ; 434
	i32 131, ; 435
	i32 258, ; 436
	i32 158, ; 437
	i32 305, ; 438
	i32 247, ; 439
	i32 174, ; 440
	i32 137, ; 441
	i32 270, ; 442
	i32 266, ; 443
	i32 166, ; 444
	i32 192, ; 445
	i32 208, ; 446
	i32 275, ; 447
	i32 39, ; 448
	i32 234, ; 449
	i32 80, ; 450
	i32 55, ; 451
	i32 36, ; 452
	i32 96, ; 453
	i32 163, ; 454
	i32 169, ; 455
	i32 271, ; 456
	i32 81, ; 457
	i32 210, ; 458
	i32 97, ; 459
	i32 29, ; 460
	i32 156, ; 461
	i32 18, ; 462
	i32 126, ; 463
	i32 118, ; 464
	i32 230, ; 465
	i32 261, ; 466
	i32 243, ; 467
	i32 263, ; 468
	i32 162, ; 469
	i32 238, ; 470
	i32 321, ; 471
	i32 260, ; 472
	i32 251, ; 473
	i32 167, ; 474
	i32 16, ; 475
	i32 176, ; 476
	i32 141, ; 477
	i32 298, ; 478
	i32 124, ; 479
	i32 117, ; 480
	i32 37, ; 481
	i32 114, ; 482
	i32 46, ; 483
	i32 139, ; 484
	i32 116, ; 485
	i32 33, ; 486
	i32 170, ; 487
	i32 94, ; 488
	i32 52, ; 489
	i32 252, ; 490
	i32 128, ; 491
	i32 150, ; 492
	i32 176, ; 493
	i32 24, ; 494
	i32 320, ; 495
	i32 158, ; 496
	i32 229, ; 497
	i32 145, ; 498
	i32 103, ; 499
	i32 88, ; 500
	i32 217, ; 501
	i32 59, ; 502
	i32 139, ; 503
	i32 99, ; 504
	i32 5, ; 505
	i32 13, ; 506
	i32 121, ; 507
	i32 134, ; 508
	i32 27, ; 509
	i32 293, ; 510
	i32 71, ; 511
	i32 227, ; 512
	i32 24, ; 513
	i32 215, ; 514
	i32 256, ; 515
	i32 253, ; 516
	i32 310, ; 517
	i32 202, ; 518
	i32 196, ; 519
	i32 208, ; 520
	i32 224, ; 521
	i32 165, ; 522
	i32 257, ; 523
	i32 289, ; 524
	i32 100, ; 525
	i32 122, ; 526
	i32 228, ; 527
	i32 180, ; 528
	i32 160, ; 529
	i32 164, ; 530
	i32 231, ; 531
	i32 38, ; 532
	i32 188, ; 533
	i32 297, ; 534
	i32 17, ; 535
	i32 168, ; 536
	i32 310, ; 537
	i32 309, ; 538
	i32 202, ; 539
	i32 147, ; 540
	i32 220, ; 541
	i32 152, ; 542
	i32 129, ; 543
	i32 19, ; 544
	i32 64, ; 545
	i32 144, ; 546
	i32 46, ; 547
	i32 317, ; 548
	i32 206, ; 549
	i32 78, ; 550
	i32 60, ; 551
	i32 105, ; 552
	i32 255, ; 553
	i32 210, ; 554
	i32 48, ; 555
	i32 241, ; 556
	i32 314, ; 557
	i32 252, ; 558
	i32 14, ; 559
	i32 179, ; 560
	i32 67, ; 561
	i32 168, ; 562
	i32 216, ; 563
	i32 220, ; 564
	i32 319, ; 565
	i32 77, ; 566
	i32 225, ; 567
	i32 107, ; 568
	i32 209, ; 569
	i32 251, ; 570
	i32 66, ; 571
	i32 62, ; 572
	i32 199, ; 573
	i32 157, ; 574
	i32 198, ; 575
	i32 218, ; 576
	i32 10, ; 577
	i32 188, ; 578
	i32 11, ; 579
	i32 77, ; 580
	i32 125, ; 581
	i32 82, ; 582
	i32 181, ; 583
	i32 65, ; 584
	i32 106, ; 585
	i32 64, ; 586
	i32 127, ; 587
	i32 121, ; 588
	i32 76, ; 589
	i32 266, ; 590
	i32 256, ; 591
	i32 318, ; 592
	i32 8, ; 593
	i32 224, ; 594
	i32 2, ; 595
	i32 43, ; 596
	i32 269, ; 597
	i32 320, ; 598
	i32 153, ; 599
	i32 127, ; 600
	i32 254, ; 601
	i32 23, ; 602
	i32 132, ; 603
	i32 212, ; 604
	i32 243, ; 605
	i32 313, ; 606
	i32 295, ; 607
	i32 28, ; 608
	i32 211, ; 609
	i32 200, ; 610
	i32 61, ; 611
	i32 190, ; 612
	i32 89, ; 613
	i32 86, ; 614
	i32 145, ; 615
	i32 192, ; 616
	i32 35, ; 617
	i32 85, ; 618
	i32 232, ; 619
	i32 177, ; 620
	i32 308, ; 621
	i32 303, ; 622
	i32 180, ; 623
	i32 49, ; 624
	i32 6, ; 625
	i32 89, ; 626
	i32 315, ; 627
	i32 21, ; 628
	i32 159, ; 629
	i32 95, ; 630
	i32 49, ; 631
	i32 112, ; 632
	i32 248, ; 633
	i32 129, ; 634
	i32 75, ; 635
	i32 199, ; 636
	i32 225, ; 637
	i32 247, ; 638
	i32 7, ; 639
	i32 189, ; 640
	i32 109, ; 641
	i32 248, ; 642
	i32 234 ; 643
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ a8cd27e430e55df3e3c1e3a43d35c11d9512a2db"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
