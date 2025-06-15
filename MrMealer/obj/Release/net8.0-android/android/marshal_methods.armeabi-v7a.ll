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

@assembly_image_cache = dso_local local_unnamed_addr global [151 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [302 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 118
	i32 26230656, ; 1: Microsoft.Extensions.DependencyModel => 0x1903f80 => 46
	i32 39109920, ; 2: Newtonsoft.Json.dll => 0x254c520 => 56
	i32 42639949, ; 3: System.Threading.Thread => 0x28aa24d => 139
	i32 67008169, ; 4: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 5: Microsoft.Maui.Graphics.dll => 0x44bb714 => 55
	i32 117431740, ; 6: System.Runtime.InteropServices => 0x6ffddbc => 130
	i32 159306688, ; 7: System.ComponentModel.Annotations => 0x97ed3c0 => 101
	i32 165246403, ; 8: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 69
	i32 182336117, ; 9: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 87
	i32 195452805, ; 10: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 11: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 12: System.ComponentModel => 0xc38ff48 => 104
	i32 230752869, ; 13: Microsoft.CSharp.dll => 0xdc10265 => 95
	i32 246610117, ; 14: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 127
	i32 280992041, ; 15: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 317674968, ; 16: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 17: Xamarin.AndroidX.Activity.dll => 0x13031348 => 65
	i32 336156722, ; 18: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 19: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 76
	i32 347068432, ; 20: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 59
	i32 356389973, ; 21: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 374914964, ; 22: System.Transactions.Local => 0x1658bf94 => 141
	i32 379916513, ; 23: System.Threading.Thread.dll => 0x16a510e1 => 139
	i32 385762202, ; 24: System.Memory.dll => 0x16fe439a => 116
	i32 395744057, ; 25: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 26: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 27: System.Collections => 0x1a61054f => 100
	i32 450948140, ; 28: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 75
	i32 459347974, ; 29: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 134
	i32 469710990, ; 30: System.dll => 0x1bff388e => 145
	i32 498788369, ; 31: System.ObjectModel => 0x1dbae811 => 122
	i32 500358224, ; 32: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 33: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 34: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 50
	i32 530272170, ; 35: System.Linq.Queryable => 0x1f9b4faa => 114
	i32 539058512, ; 36: Microsoft.Extensions.Logging => 0x20216150 => 47
	i32 592146354, ; 37: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 627609679, ; 38: Xamarin.AndroidX.CustomView => 0x2568904f => 73
	i32 627931235, ; 39: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 40: System.Text.Encodings.Web.dll => 0x27787397 => 63
	i32 672442732, ; 41: System.Collections.Concurrent => 0x2814a96c => 96
	i32 688181140, ; 42: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 690569205, ; 43: System.Xml.Linq.dll => 0x29293ff5 => 142
	i32 706645707, ; 44: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 45: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 46: System.Runtime.Loader.dll => 0x2b15ed29 => 131
	i32 748832960, ; 47: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 57
	i32 759454413, ; 48: System.Net.Requests => 0x2d445acd => 120
	i32 775507847, ; 49: System.IO.Compression => 0x2e394f87 => 112
	i32 777317022, ; 50: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 51: Microsoft.Extensions.Options => 0x2f0980eb => 49
	i32 804715423, ; 52: System.Data.Common => 0x2ff6fb9f => 106
	i32 823281589, ; 53: System.Private.Uri.dll => 0x311247b5 => 123
	i32 830298997, ; 54: System.IO.Compression.Brotli => 0x317d5b75 => 111
	i32 904024072, ; 55: System.ComponentModel.Primitives.dll => 0x35e25008 => 102
	i32 926902833, ; 56: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 955402788, ; 57: Newtonsoft.Json => 0x38f24a24 => 56
	i32 967690846, ; 58: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 76
	i32 975236339, ; 59: System.Diagnostics.Tracing => 0x3a20ecf3 => 108
	i32 975874589, ; 60: System.Xml.XDocument => 0x3a2aaa1d => 144
	i32 992768348, ; 61: System.Collections.dll => 0x3b2c715c => 100
	i32 994640506, ; 62: MrMealer => 0x3b49027a => 94
	i32 1012816738, ; 63: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 86
	i32 1019214401, ; 64: System.Drawing => 0x3cbffa41 => 110
	i32 1028951442, ; 65: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 45
	i32 1029334545, ; 66: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 67: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 66
	i32 1036536393, ; 68: System.Drawing.Primitives.dll => 0x3dc84a49 => 109
	i32 1044663988, ; 69: System.Linq.Expressions.dll => 0x3e444eb4 => 113
	i32 1052210849, ; 70: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 78
	i32 1082857460, ; 71: System.ComponentModel.TypeConverter => 0x408b17f4 => 103
	i32 1084122840, ; 72: Xamarin.Kotlin.StdLib => 0x409e66d8 => 91
	i32 1098259244, ; 73: System => 0x41761b2c => 145
	i32 1118262833, ; 74: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1157931901, ; 75: Microsoft.EntityFrameworkCore.Abstractions => 0x4504a37d => 37
	i32 1168523401, ; 76: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 77: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 83
	i32 1202000627, ; 78: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x47a512f3 => 37
	i32 1203215381, ; 79: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1204575371, ; 80: Microsoft.Extensions.Caching.Memory.dll => 0x47cc5c8b => 41
	i32 1234928153, ; 81: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1260983243, ; 82: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1292207520, ; 83: SQLitePCLRaw.core.dll => 0x4d0585a0 => 58
	i32 1293217323, ; 84: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 74
	i32 1324164729, ; 85: System.Linq => 0x4eed2679 => 115
	i32 1373134921, ; 86: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 87: Xamarin.AndroidX.SavedState => 0x52114ed3 => 86
	i32 1406073936, ; 88: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 70
	i32 1408764838, ; 89: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 133
	i32 1430672901, ; 90: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1461004990, ; 91: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 92: System.Collections.Immutable.dll => 0x5718a9ef => 97
	i32 1462112819, ; 93: System.IO.Compression.dll => 0x57261233 => 112
	i32 1469204771, ; 94: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 67
	i32 1470490898, ; 95: Microsoft.Extensions.Primitives => 0x57a5e912 => 50
	i32 1479771757, ; 96: System.Collections.Immutable => 0x5833866d => 97
	i32 1480492111, ; 97: System.IO.Compression.Brotli.dll => 0x583e844f => 111
	i32 1490351284, ; 98: Microsoft.Data.Sqlite.dll => 0x58d4f4b4 => 35
	i32 1493001747, ; 99: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1514721132, ; 100: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1543031311, ; 101: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1551623176, ; 102: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1622152042, ; 103: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 80
	i32 1624863272, ; 104: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 89
	i32 1636350590, ; 105: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 72
	i32 1639515021, ; 106: System.Net.Http.dll => 0x61b9038d => 117
	i32 1639986890, ; 107: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1657153582, ; 108: System.Runtime => 0x62c6282e => 135
	i32 1658251792, ; 109: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 90
	i32 1677501392, ; 110: System.Net.Primitives.dll => 0x63fca3d0 => 119
	i32 1679769178, ; 111: System.Security.Cryptography => 0x641f3e5a => 136
	i32 1688112883, ; 112: Microsoft.Data.Sqlite => 0x649e8ef3 => 35
	i32 1689493916, ; 113: Microsoft.EntityFrameworkCore.dll => 0x64b3a19c => 36
	i32 1711441057, ; 114: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 59
	i32 1729485958, ; 115: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 68
	i32 1736233607, ; 116: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 117: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1744735666, ; 118: System.Transactions.Local.dll => 0x67fe8db2 => 141
	i32 1746115085, ; 119: System.IO.Pipelines.dll => 0x68139a0d => 62
	i32 1763938596, ; 120: System.Diagnostics.TraceSource.dll => 0x69239124 => 107
	i32 1766324549, ; 121: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 87
	i32 1770582343, ; 122: Microsoft.Extensions.Logging.dll => 0x6988f147 => 47
	i32 1780572499, ; 123: Mono.Android.Runtime.dll => 0x6a216153 => 149
	i32 1782862114, ; 124: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 125: Xamarin.AndroidX.Fragment => 0x6a96652d => 75
	i32 1793755602, ; 126: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 127: Xamarin.AndroidX.Loader => 0x6bcd3296 => 80
	i32 1813058853, ; 128: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 91
	i32 1813201214, ; 129: Xamarin.Google.Android.Material => 0x6c13413e => 90
	i32 1818569960, ; 130: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 84
	i32 1824175904, ; 131: System.Text.Encoding.Extensions => 0x6cbab720 => 137
	i32 1824722060, ; 132: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 133
	i32 1828688058, ; 133: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 48
	i32 1842015223, ; 134: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 135: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 136: System.Linq.Expressions => 0x6ec71a65 => 113
	i32 1870277092, ; 137: System.Reflection.Primitives => 0x6f7a29e4 => 128
	i32 1875935024, ; 138: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1886040351, ; 139: Microsoft.EntityFrameworkCore.Sqlite.dll => 0x706ab11f => 39
	i32 1910275211, ; 140: System.Collections.NonGeneric.dll => 0x71dc7c8b => 98
	i32 1939592360, ; 141: System.Private.Xml.Linq => 0x739bd4a8 => 124
	i32 1968388702, ; 142: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 42
	i32 2003115576, ; 143: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2014489277, ; 144: Microsoft.EntityFrameworkCore.Sqlite => 0x7812aabd => 39
	i32 2019465201, ; 145: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 78
	i32 2025202353, ; 146: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2045470958, ; 147: System.Private.Xml => 0x79eb68ee => 125
	i32 2055257422, ; 148: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 77
	i32 2066184531, ; 149: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 150: System.Diagnostics.TraceSource => 0x7b6f419e => 107
	i32 2079903147, ; 151: System.Runtime.dll => 0x7bf8cdab => 135
	i32 2090596640, ; 152: System.Numerics.Vectors => 0x7c9bf920 => 121
	i32 2103459038, ; 153: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 60
	i32 2127167465, ; 154: System.Console => 0x7ec9ffe9 => 105
	i32 2142473426, ; 155: System.Collections.Specialized => 0x7fb38cd2 => 99
	i32 2159891885, ; 156: Microsoft.Maui => 0x80bd55ad => 53
	i32 2169148018, ; 157: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 158: Microsoft.Extensions.Options.dll => 0x820d22b3 => 49
	i32 2192057212, ; 159: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 48
	i32 2193016926, ; 160: System.ObjectModel.dll => 0x82b6c85e => 122
	i32 2197979891, ; 161: Microsoft.Extensions.DependencyModel.dll => 0x830282f3 => 46
	i32 2201107256, ; 162: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 92
	i32 2201231467, ; 163: System.Net.Http => 0x8334206b => 117
	i32 2207618523, ; 164: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2252897993, ; 165: Microsoft.EntityFrameworkCore => 0x86487ec9 => 36
	i32 2266799131, ; 166: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 43
	i32 2270573516, ; 167: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 168: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 85
	i32 2303942373, ; 169: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 170: System.Private.CoreLib.dll => 0x896b7878 => 147
	i32 2340441535, ; 171: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 129
	i32 2353062107, ; 172: System.Net.Primitives => 0x8c40e0db => 119
	i32 2368005991, ; 173: System.Xml.ReaderWriter.dll => 0x8d24e767 => 143
	i32 2371007202, ; 174: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 42
	i32 2395872292, ; 175: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2427813419, ; 176: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 177: System.Console.dll => 0x912896e5 => 105
	i32 2465273461, ; 178: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 57
	i32 2471841756, ; 179: netstandard.dll => 0x93554fdc => 146
	i32 2475788418, ; 180: Java.Interop.dll => 0x93918882 => 148
	i32 2480646305, ; 181: Microsoft.Maui.Controls => 0x93dba8a1 => 51
	i32 2538310050, ; 182: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 127
	i32 2550873716, ; 183: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2562349572, ; 184: Microsoft.CSharp => 0x98ba5a04 => 95
	i32 2570120770, ; 185: System.Text.Encodings.Web => 0x9930ee42 => 63
	i32 2585220780, ; 186: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 137
	i32 2593496499, ; 187: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 188: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 92
	i32 2617129537, ; 189: System.Private.Xml.dll => 0x9bfe3a41 => 125
	i32 2620871830, ; 190: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 72
	i32 2626831493, ; 191: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2634653062, ; 192: Microsoft.EntityFrameworkCore.Relational.dll => 0x9d099d86 => 38
	i32 2663698177, ; 193: System.Runtime.Loader => 0x9ec4cf01 => 131
	i32 2664396074, ; 194: System.Xml.XDocument.dll => 0x9ecf752a => 144
	i32 2665622720, ; 195: System.Drawing.Primitives => 0x9ee22cc0 => 109
	i32 2676780864, ; 196: System.Data.Common.dll => 0x9f8c6f40 => 106
	i32 2724373263, ; 197: System.Runtime.Numerics.dll => 0xa262a30f => 132
	i32 2732626843, ; 198: Xamarin.AndroidX.Activity => 0xa2e0939b => 65
	i32 2737747696, ; 199: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 67
	i32 2752995522, ; 200: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 201: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 52
	i32 2764765095, ; 202: Microsoft.Maui.dll => 0xa4caf7a7 => 53
	i32 2778768386, ; 203: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 88
	i32 2781477104, ; 204: MrMealer.dll => 0xa5c9f8f0 => 94
	i32 2785988530, ; 205: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 206: Microsoft.Maui.Graphics => 0xa7008e0b => 55
	i32 2806116107, ; 207: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 208: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 70
	i32 2831556043, ; 209: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2847789619, ; 210: Microsoft.EntityFrameworkCore.Relational => 0xa9bdd233 => 38
	i32 2853208004, ; 211: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 88
	i32 2861189240, ; 212: Microsoft.Maui.Essentials => 0xaa8a4878 => 54
	i32 2909740682, ; 213: System.Private.CoreLib => 0xad6f1e8a => 147
	i32 2916838712, ; 214: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 89
	i32 2919462931, ; 215: System.Numerics.Vectors.dll => 0xae037813 => 121
	i32 2959614098, ; 216: System.ComponentModel.dll => 0xb0682092 => 104
	i32 2978675010, ; 217: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 74
	i32 3038032645, ; 218: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3057625584, ; 219: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 81
	i32 3059408633, ; 220: Mono.Android.Runtime => 0xb65adef9 => 149
	i32 3059793426, ; 221: System.ComponentModel.Primitives => 0xb660be12 => 102
	i32 3069363400, ; 222: Microsoft.Extensions.Caching.Abstractions.dll => 0xb6f2c4c8 => 40
	i32 3077302341, ; 223: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3147165239, ; 224: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 108
	i32 3159123045, ; 225: System.Reflection.Primitives.dll => 0xbc4c6465 => 128
	i32 3178803400, ; 226: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 82
	i32 3195844289, ; 227: Microsoft.Extensions.Caching.Abstractions => 0xbe7cb6c1 => 40
	i32 3207841594, ; 228: MrMealer.Database.dll => 0xbf33c73a => 93
	i32 3220365878, ; 229: System.Threading => 0xbff2e236 => 140
	i32 3258312781, ; 230: Xamarin.AndroidX.CardView => 0xc235e84d => 68
	i32 3265493905, ; 231: System.Linq.Queryable.dll => 0xc2a37b91 => 114
	i32 3280506390, ; 232: System.ComponentModel.Annotations.dll => 0xc3888e16 => 101
	i32 3305363605, ; 233: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 234: System.Net.Requests.dll => 0xc5b097e4 => 120
	i32 3317135071, ; 235: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 73
	i32 3346324047, ; 236: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 83
	i32 3357674450, ; 237: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 238: System.Text.Json => 0xc82afec1 => 64
	i32 3360279109, ; 239: SQLitePCLRaw.core => 0xc849ca45 => 58
	i32 3362522851, ; 240: Xamarin.AndroidX.Core => 0xc86c06e3 => 71
	i32 3366347497, ; 241: Java.Interop => 0xc8a662e9 => 148
	i32 3374999561, ; 242: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 85
	i32 3381016424, ; 243: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 244: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 44
	i32 3430777524, ; 245: netstandard => 0xcc7d82b4 => 146
	i32 3463511458, ; 246: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 247: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 103
	i32 3476120550, ; 248: Mono.Android => 0xcf3163e6 => 150
	i32 3479583265, ; 249: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 250: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 251: System.Text.Json.dll => 0xcfbaacae => 64
	i32 3509114376, ; 252: System.Xml.Linq => 0xd128d608 => 142
	i32 3580758918, ; 253: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3608519521, ; 254: System.Linq.dll => 0xd715a361 => 115
	i32 3624195450, ; 255: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 129
	i32 3641597786, ; 256: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 77
	i32 3643446276, ; 257: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 258: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 82
	i32 3657292374, ; 259: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 43
	i32 3660523487, ; 260: System.Net.NetworkInformation => 0xda2f27df => 118
	i32 3672681054, ; 261: Mono.Android.dll => 0xdae8aa5e => 150
	i32 3697841164, ; 262: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3724971120, ; 263: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 81
	i32 3748608112, ; 264: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 61
	i32 3754567612, ; 265: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 60
	i32 3786282454, ; 266: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 69
	i32 3792276235, ; 267: System.Collections.NonGeneric => 0xe2098b0b => 98
	i32 3802395368, ; 268: System.Collections.Specialized.dll => 0xe2a3f2e8 => 99
	i32 3823082795, ; 269: System.Security.Cryptography.dll => 0xe3df9d2b => 136
	i32 3841636137, ; 270: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 45
	i32 3849253459, ; 271: System.Runtime.InteropServices.dll => 0xe56ef253 => 130
	i32 3889960447, ; 272: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 273: System.Collections.Concurrent.dll => 0xe839deed => 96
	i32 3896760992, ; 274: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 71
	i32 3922226020, ; 275: MrMealer.Database => 0xe9c86b64 => 93
	i32 3928044579, ; 276: System.Xml.ReaderWriter => 0xea213423 => 143
	i32 3931092270, ; 277: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 84
	i32 3955647286, ; 278: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 66
	i32 3980434154, ; 279: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 280: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4023392905, ; 281: System.IO.Pipelines => 0xefd01a89 => 62
	i32 4025784931, ; 282: System.Memory => 0xeff49a63 => 116
	i32 4046471985, ; 283: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 52
	i32 4054681211, ; 284: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 126
	i32 4068434129, ; 285: System.Private.Xml.Linq.dll => 0xf27f60d1 => 124
	i32 4073602200, ; 286: System.Threading.dll => 0xf2ce3c98 => 140
	i32 4094352644, ; 287: Microsoft.Maui.Essentials.dll => 0xf40add04 => 54
	i32 4099507663, ; 288: System.Drawing.dll => 0xf45985cf => 110
	i32 4100113165, ; 289: System.Private.Uri => 0xf462c30d => 123
	i32 4101842092, ; 290: Microsoft.Extensions.Caching.Memory => 0xf47d24ac => 41
	i32 4102112229, ; 291: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 292: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 293: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 44
	i32 4147896353, ; 294: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 126
	i32 4150914736, ; 295: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4181436372, ; 296: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 134
	i32 4182413190, ; 297: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 79
	i32 4213026141, ; 298: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 61
	i32 4271975918, ; 299: Microsoft.Maui.Controls.dll => 0xfea12dee => 51
	i32 4274976490, ; 300: System.Runtime.Numerics => 0xfecef6ea => 132
	i32 4292120959 ; 301: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 79
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [302 x i32] [
	i32 118, ; 0
	i32 46, ; 1
	i32 56, ; 2
	i32 139, ; 3
	i32 33, ; 4
	i32 55, ; 5
	i32 130, ; 6
	i32 101, ; 7
	i32 69, ; 8
	i32 87, ; 9
	i32 30, ; 10
	i32 31, ; 11
	i32 104, ; 12
	i32 95, ; 13
	i32 127, ; 14
	i32 2, ; 15
	i32 30, ; 16
	i32 65, ; 17
	i32 15, ; 18
	i32 76, ; 19
	i32 59, ; 20
	i32 14, ; 21
	i32 141, ; 22
	i32 139, ; 23
	i32 116, ; 24
	i32 34, ; 25
	i32 26, ; 26
	i32 100, ; 27
	i32 75, ; 28
	i32 134, ; 29
	i32 145, ; 30
	i32 122, ; 31
	i32 13, ; 32
	i32 7, ; 33
	i32 50, ; 34
	i32 114, ; 35
	i32 47, ; 36
	i32 21, ; 37
	i32 73, ; 38
	i32 19, ; 39
	i32 63, ; 40
	i32 96, ; 41
	i32 1, ; 42
	i32 142, ; 43
	i32 16, ; 44
	i32 4, ; 45
	i32 131, ; 46
	i32 57, ; 47
	i32 120, ; 48
	i32 112, ; 49
	i32 25, ; 50
	i32 49, ; 51
	i32 106, ; 52
	i32 123, ; 53
	i32 111, ; 54
	i32 102, ; 55
	i32 28, ; 56
	i32 56, ; 57
	i32 76, ; 58
	i32 108, ; 59
	i32 144, ; 60
	i32 100, ; 61
	i32 94, ; 62
	i32 86, ; 63
	i32 110, ; 64
	i32 45, ; 65
	i32 3, ; 66
	i32 66, ; 67
	i32 109, ; 68
	i32 113, ; 69
	i32 78, ; 70
	i32 103, ; 71
	i32 91, ; 72
	i32 145, ; 73
	i32 16, ; 74
	i32 37, ; 75
	i32 22, ; 76
	i32 83, ; 77
	i32 37, ; 78
	i32 20, ; 79
	i32 41, ; 80
	i32 18, ; 81
	i32 2, ; 82
	i32 58, ; 83
	i32 74, ; 84
	i32 115, ; 85
	i32 32, ; 86
	i32 86, ; 87
	i32 70, ; 88
	i32 133, ; 89
	i32 0, ; 90
	i32 6, ; 91
	i32 97, ; 92
	i32 112, ; 93
	i32 67, ; 94
	i32 50, ; 95
	i32 97, ; 96
	i32 111, ; 97
	i32 35, ; 98
	i32 10, ; 99
	i32 5, ; 100
	i32 138, ; 101
	i32 25, ; 102
	i32 80, ; 103
	i32 89, ; 104
	i32 72, ; 105
	i32 117, ; 106
	i32 138, ; 107
	i32 135, ; 108
	i32 90, ; 109
	i32 119, ; 110
	i32 136, ; 111
	i32 35, ; 112
	i32 36, ; 113
	i32 59, ; 114
	i32 68, ; 115
	i32 23, ; 116
	i32 1, ; 117
	i32 141, ; 118
	i32 62, ; 119
	i32 107, ; 120
	i32 87, ; 121
	i32 47, ; 122
	i32 149, ; 123
	i32 17, ; 124
	i32 75, ; 125
	i32 9, ; 126
	i32 80, ; 127
	i32 91, ; 128
	i32 90, ; 129
	i32 84, ; 130
	i32 137, ; 131
	i32 133, ; 132
	i32 48, ; 133
	i32 29, ; 134
	i32 26, ; 135
	i32 113, ; 136
	i32 128, ; 137
	i32 8, ; 138
	i32 39, ; 139
	i32 98, ; 140
	i32 124, ; 141
	i32 42, ; 142
	i32 5, ; 143
	i32 39, ; 144
	i32 78, ; 145
	i32 0, ; 146
	i32 125, ; 147
	i32 77, ; 148
	i32 4, ; 149
	i32 107, ; 150
	i32 135, ; 151
	i32 121, ; 152
	i32 60, ; 153
	i32 105, ; 154
	i32 99, ; 155
	i32 53, ; 156
	i32 12, ; 157
	i32 49, ; 158
	i32 48, ; 159
	i32 122, ; 160
	i32 46, ; 161
	i32 92, ; 162
	i32 117, ; 163
	i32 14, ; 164
	i32 36, ; 165
	i32 43, ; 166
	i32 8, ; 167
	i32 85, ; 168
	i32 18, ; 169
	i32 147, ; 170
	i32 129, ; 171
	i32 119, ; 172
	i32 143, ; 173
	i32 42, ; 174
	i32 13, ; 175
	i32 10, ; 176
	i32 105, ; 177
	i32 57, ; 178
	i32 146, ; 179
	i32 148, ; 180
	i32 51, ; 181
	i32 127, ; 182
	i32 11, ; 183
	i32 95, ; 184
	i32 63, ; 185
	i32 137, ; 186
	i32 20, ; 187
	i32 92, ; 188
	i32 125, ; 189
	i32 72, ; 190
	i32 15, ; 191
	i32 38, ; 192
	i32 131, ; 193
	i32 144, ; 194
	i32 109, ; 195
	i32 106, ; 196
	i32 132, ; 197
	i32 65, ; 198
	i32 67, ; 199
	i32 21, ; 200
	i32 52, ; 201
	i32 53, ; 202
	i32 88, ; 203
	i32 94, ; 204
	i32 27, ; 205
	i32 55, ; 206
	i32 6, ; 207
	i32 70, ; 208
	i32 19, ; 209
	i32 38, ; 210
	i32 88, ; 211
	i32 54, ; 212
	i32 147, ; 213
	i32 89, ; 214
	i32 121, ; 215
	i32 104, ; 216
	i32 74, ; 217
	i32 34, ; 218
	i32 81, ; 219
	i32 149, ; 220
	i32 102, ; 221
	i32 40, ; 222
	i32 12, ; 223
	i32 108, ; 224
	i32 128, ; 225
	i32 82, ; 226
	i32 40, ; 227
	i32 93, ; 228
	i32 140, ; 229
	i32 68, ; 230
	i32 114, ; 231
	i32 101, ; 232
	i32 7, ; 233
	i32 120, ; 234
	i32 73, ; 235
	i32 83, ; 236
	i32 24, ; 237
	i32 64, ; 238
	i32 58, ; 239
	i32 71, ; 240
	i32 148, ; 241
	i32 85, ; 242
	i32 3, ; 243
	i32 44, ; 244
	i32 146, ; 245
	i32 11, ; 246
	i32 103, ; 247
	i32 150, ; 248
	i32 24, ; 249
	i32 23, ; 250
	i32 64, ; 251
	i32 142, ; 252
	i32 31, ; 253
	i32 115, ; 254
	i32 129, ; 255
	i32 77, ; 256
	i32 28, ; 257
	i32 82, ; 258
	i32 43, ; 259
	i32 118, ; 260
	i32 150, ; 261
	i32 33, ; 262
	i32 81, ; 263
	i32 61, ; 264
	i32 60, ; 265
	i32 69, ; 266
	i32 98, ; 267
	i32 99, ; 268
	i32 136, ; 269
	i32 45, ; 270
	i32 130, ; 271
	i32 32, ; 272
	i32 96, ; 273
	i32 71, ; 274
	i32 93, ; 275
	i32 143, ; 276
	i32 84, ; 277
	i32 66, ; 278
	i32 27, ; 279
	i32 9, ; 280
	i32 62, ; 281
	i32 116, ; 282
	i32 52, ; 283
	i32 126, ; 284
	i32 124, ; 285
	i32 140, ; 286
	i32 54, ; 287
	i32 110, ; 288
	i32 123, ; 289
	i32 41, ; 290
	i32 22, ; 291
	i32 17, ; 292
	i32 44, ; 293
	i32 126, ; 294
	i32 29, ; 295
	i32 134, ; 296
	i32 79, ; 297
	i32 61, ; 298
	i32 51, ; 299
	i32 132, ; 300
	i32 79 ; 301
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
