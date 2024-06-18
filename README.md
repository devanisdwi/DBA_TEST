# MySQL Simple Data Structure for Marketplace

### Before

![before](https://github.com/devanisdwi/DBA_TEST/blob/main/Before.png)

### After

![after](https://github.com/devanisdwi/DBA_TEST/blob/main/After.png)

Metode yang digunakan pada perancangan database diatas adalah sebagai berikut:
1. Naming Convention
   - Berbahasa inggris untuk membedakan kata yang bermakna plural dan singular.
   - Style snake case untuk konsistensi.
   - Tabel referensi yang selalu diawali dengan penamaan rf_*.
2. Penggunaan tabel referensi sebagai rujukan utama untuk kolom categorical yang memiliki value yang unique, bervariasi, hampir ada disetiap tabel. Hal ini digunakan untuk mempermudah filter data karena pada tabel utama cukup memfilter menggunakan id dari tabel referensi.
3. Indexing
   - Index terpisah karena lebih fleksibel dalam memfilter tiap kolom yang lebih spesifik.
   - Mempercepat proses kinerja filter data.
   - Mudah dikelola dalam berbagai skenario.
4. Tipe Data sesuai dengan kebutuhan bisnis.
