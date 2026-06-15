FROM odoo:15

# نسخ ملف الإعدادات من جذر المستودع إلى المسار الافتراضي داخل الحاوية
COPY ./odoo.conf /etc/odoo/odoo.conf

# تأمين صلاحيات الملف وتثبيت أداة psql لتنظيف قاعدة البيانات
USER root
RUN chown odoo:odoo /etc/odoo/odoo.conf && \
    apt-get update && \
    apt-get install -y postgresql-client && \
    rm -rf /var/lib/apt/lists/*

# العودة للمستخدم الطبيعي لـ Odoo
USER odoo

# الأمر النهائي لـ Render: تنظيف الأصول المكسورة من Supabase أولاً ثم تشغيل السيرفر فوراً
CMD psql "postgres://USER:PASSWORD@HOST:PORT/odoo_em2k" -c "DELETE FROM ir_attachment WHERE url LIKE '/web/content/%assets_%';" && odoo
