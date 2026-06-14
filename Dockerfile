FROM odoo:15

# إذا كنت تريد مستقبلاً إضافة موديلات مخصصة (Custom Addons)، يمكنك تفعيل السطرين أدناه:
# COPY ./custom_addons /mnt/extra-addons
# USER root
# RUN chown -R odoo /mnt/extra-addons
# USER odoo
