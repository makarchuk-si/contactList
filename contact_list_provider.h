#ifndef CONTACTMODEL_H
#define CONTACTMODEL_H

#include <QAbstractListModel>


const QString defaultImage {"default_contact.png"};

class ContactListProvider : public QAbstractListModel
{
    Q_OBJECT

public:
    enum ContactRole {
        FullNameRole = Qt::DisplayRole,
        NumberRole = Qt::UserRole,
        IsFavouriteRole,
        ImageRole
    };
    Q_ENUM(ContactRole)

    ContactListProvider(QObject *parent = nullptr);

    int rowCount(const QModelIndex & = QModelIndex()) const;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
    QHash<int, QByteArray> roleNames() const;

    Q_INVOKABLE QVariantMap get(int row) const;
    Q_INVOKABLE void append(const QString &fullName, const QString &number, const bool &isFavourite, const QString &image);
    Q_INVOKABLE void set(int row, const QString &fullName, const QString &number, const bool &isFavourite, const QString &image);
    Q_INVOKABLE void remove(int row);

private:
    struct Contact {
        QString fullName;
        QString number;
        bool isFavourite { false };
        QString image { defaultImage };
    };

    QList<Contact> m_contacts;
};

#endif // CONTACTMODEL_H
