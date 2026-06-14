FROM odoo:15

# نسخ ملف الإعدادات من جذر المستودع إلى المسار الافتراضي داخل الحاوية
COPY ./odoo.conf /etc/odoo/odoo.conf

# تأمين صلاحيات الملف لكي يتمكن مستخدم odoo من قراءته
USER root
RUN chown odoo:odoo /etc/odoo/odoo.conf
USER odoo
