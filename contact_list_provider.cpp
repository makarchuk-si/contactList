#include "contact_list_provider.h"

ContactListProvider::ContactListProvider(QObject *parent ) : QAbstractListModel(parent)
{
    m_contacts.append({ "Andij Komar" , "+38 111 345 9534" , true, defaultImage});
    m_contacts.append({ "Bender Bender", "" , false, "bender.jpg"});
    m_contacts.append({ "Petya Bohdan", "+38 059 378 9453" , true, "petia.png"});
    m_contacts.append({ "John Newyork", "+38 015 341 4234" , false, defaultImage});
    m_contacts.append({ "Serhii Malyy", "+38 111 345 9534" , false, defaultImage});
    m_contacts.append({ "Ann Ann", "8 800 555 3535" , true, "adf8354.png"});
    m_contacts.append({ "Nickname", "83231 342 634" , false, defaultImage});
    m_contacts.append({ "Christoph Schneider", "0343 124 4492" , true, defaultImage});
    m_contacts.append({ "Sahra", "034 354 4523" , false, defaultImage});
    m_contacts.append({ "Imagination", "unknown" , false, defaultImage});
    m_contacts.append({ "Stepan Pantera", "+38 111 345 9534" , false, "panterka.jpg"});
    m_contacts.append({ "Oleksa Mosienko", "036 8491 1321" , false, "aleksei.jpg"});
}

int ContactListProvider::rowCount(const QModelIndex &) const
{
    return m_contacts.count();
}

QVariant ContactListProvider::data(const QModelIndex &index, int role) const
{
    if (index.row() < rowCount())
        switch (role) {
        case FullNameRole: return m_contacts.at(index.row()).fullName;
        case NumberRole: return m_contacts.at(index.row()).number;
        case IsFavouriteRole: return m_contacts.at(index.row()).isFavourite;
        case ImageRole: return m_contacts.at(index.row()).image;
        default: return QVariant();
    }
    return QVariant();
}

QHash<int, QByteArray> ContactListProvider::roleNames() const
{
    static const QHash<int, QByteArray> roles {
        { FullNameRole, "fullName" },
        { NumberRole, "number" },
        { IsFavouriteRole, "isFavourite" },
        { ImageRole, "image" }
    };
    return roles;
}

QVariantMap ContactListProvider::get(int row) const
{
    const Contact contact = m_contacts.value(row);
    return { {"fullName", contact.fullName}, {"number", contact.number},  {"isFavourite", contact.isFavourite}, {"image", contact.image}};
}

void ContactListProvider::append(const QString &fullName, const QString &number, const bool &isFavourite, const QString &image)
{
    int row = 0;
    while (row < m_contacts.count() && fullName > m_contacts.at(row).fullName)
        ++row;
    beginInsertRows(QModelIndex(), row, row);
    m_contacts.insert(row, {fullName, number, isFavourite, image});
    endInsertRows();
}

void ContactListProvider::set(int row, const QString &fullName, const QString &number, const bool &isFavourite, const QString &image)
{
    if (row < 0 || row >= m_contacts.count())
        return;

    m_contacts.replace(row, { fullName, number, isFavourite, image });
    dataChanged(index(row, 0), index(row, 0), { FullNameRole, NumberRole, IsFavouriteRole, ImageRole });
}

void ContactListProvider::remove(int row)
{
    if (row < 0 || row >= m_contacts.count())
        return;

    beginRemoveRows(QModelIndex(), row, row);
    m_contacts.removeAt(row);
    endRemoveRows();
}
