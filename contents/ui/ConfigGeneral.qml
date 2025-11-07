import QtQuick 2.15
import QtQuick.Layouts 1.0
import org.kde.kirigami 2.20 as Kirigami
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 3.0 as PlasmaComponents

// Hatalı KCM bileşeni yerine basit bir Item kök öğesi kullanılıyor.
// Ayarlar penceresi bu dosyayı yüklediğinde, içindeki FormLayout doğrudan görünecektir.
Item {
    // Bu, düzenin ayarlar penceresinin tüm genişliğini ve yüksekliğini kullanmasını sağlar.
    implicitWidth: mainLayout.implicitWidth
    implicitHeight: mainLayout.implicitHeight

    Kirigami.FormLayout {
        id: mainLayout
        anchors.fill: parent

        // Widget Hizalaması
        PlasmaComponents.ComboBox {
            Kirigami.FormData.label: i18n("Widget Alignment")
            model: [i18n("Bottom"), i18n("Top")]
            // Seçili öğenin dizinini doğrudan yapılandırmaya bağlıyoruz.
            currentIndex: plasmoid.configuration.displayPosition
            // Kullanıcı yeni bir öğe seçtiğinde, değişikliği yapılandırmaya kaydediyoruz.
            onCurrentIndexChanged: {
                plasmoid.configuration.displayPosition = currentIndex
            }
        }

        // Çubuk Genişliği
        PlasmaComponents.ComboBox {
            Kirigami.FormData.label: i18n("Bar Width")
            model: [8, 16, 24]
            // Seçili metni doğrudan yapılandırmaya bağlıyoruz.
            currentText: plasmoid.configuration.barsWidth
            // Kullanıcı yeni bir öğe seçtiğinde, değişikliği yapılandırmaya kaydediyoruz.
            onCurrentTextChanged: {
                plasmoid.configuration.barsWidth = currentText
            }
        }

        // Çubuk Aralığı
        PlasmaComponents.ComboBox {
            Kirigami.FormData.label: i18n("Bar Separation")
            model: [4, 8, 16, 20, 24]
            // Seçili metni doğrudan yapılandırmaya bağlıyoruz.
            currentText: plasmoid.configuration.barsSeparation
            // Kullanıcı yeni bir öğe seçtiğinde, değişikliği yapılandırmaya kaydediyoruz.
            onCurrentTextChanged: {
                plasmoid.configuration.barsSeparation = currentText
            }
        }

        // Çubuk Rengi
        Kirigami.ColorButton {
            Kirigami.FormData.label: i18n("Bar Color")
            // Renk özelliğini doğrudan yapılandırmaya bağlıyoruz.
            color: plasmoid.configuration.barColor
            // Kullanıcı yeni bir renk seçtiğinde, değişikliği yapılandırmaya kaydediyoruz.
            onColorChanged: {
                plasmoid.configuration.barColor = color
            }
        }
    }
}
