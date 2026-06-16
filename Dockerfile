FROM odoo:15

# نسخ ملف الإعدادات من جذر المستودع إلى المسار الافتراضي داخل الحاوية
COPY ./odoo.conf /etc/odoo/odoo.conf

# تأمين صلاحيات الملف
USER root
RUN chown odoo:odoo /etc/odoo/odoo.conf
USER odoo

# الأمر النهائي: إجبار Odoo على تحديث موديول الويب لإعادة بناء الـ Filestore المفقود تلقائياً
CMD ["odoo", "-c", "/etc/odoo/odoo.conf", "-u", "web", "--workers=0"]

COPY ./custom_addons /mnt/extra-addons
USER root
RUN chown -R odoo:odoo /var/lib/odoo
USER odoo
