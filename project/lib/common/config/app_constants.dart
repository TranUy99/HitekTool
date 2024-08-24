const int SIZE_UPLOAD_IMAGE = 1024;
const int SIZE_UPLOAD_HIGH_QUALITY_IMAGE = 1024;

const int LIMIT = 20;

const int PLACEHOLDER_ITEM_LENGTH = 30;
const int LONG_TITLE_LENGTH = 10;
const int SHORT_TITLE_LENGTH = 5;

final String LONG_TITLE_PLACEHOLDER =
    List.generate(LONG_TITLE_LENGTH, (index) => index).join("").toString();

final String SHORT_TITLE_PLACEHOLDER =
    List.generate(SHORT_TITLE_LENGTH, (index) => index).join("").toString();
