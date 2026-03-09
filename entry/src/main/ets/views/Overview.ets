import { LineChart,LineChartModel,LineData, LineDataSet,EntryOhos, JArrayList, XAxisPosition } from "@ohos/mpchart";
import { DateFormatter, TodayWeight } from "../common/GenreInterface";
import PageHeader from "../component/PageHeader";
import { get } from "../utils/DatabaseUtil";
import DateUtil from "../utils/DateUtil";
import { common } from "@kit.AbilityKit";

@Builder
export function Factory() {
  Overview();
}

@Component
struct Overview {
  private model: LineChartModel = new LineChartModel();
  private context = this.getUIContext().getHostContext() as common.UIAbilityContext;
  private labels: string[] = [];

  async aboutToAppear() {

    let values = new JArrayList<EntryOhos>();
    const array = await get<TodayWeight[]>(this.context,"weight");
    if(array) {
      for (let i = 0; i < array.length; i++) {
        values.add(new EntryOhos(i, Number(array[i].weight)));
        this.labels.push(DateUtil.formatDate(array[i].date,"MM-dd"));
      }
    }
    let dataSet = new LineDataSet(values, "体重(kg)");
    dataSet.setColorByColor(0xfcb8be);
    dataSet.setCircleColor(0xfcb8be);
    dataSet.setCircleRadius(4);
    dataSet.setDrawCircleHole(true);
    dataSet.setCircleHoleColor(Color.White);
    dataSet.setCircleHoleRadius(2);
    dataSet.setMode(2);
    dataSet.setDrawFilled(true);
    dataSet.setFillColor(0xfcb8be);
    dataSet.setFillAlpha(30);

    let lineData = new LineData([dataSet]);
    this.model.setData(lineData);

    let description = this.model.getDescription();
    if (description) {
      description.setEnabled(false);
    }

    let legend = this.model.getLegend();
    if (legend) {
      legend.setEnabled(true);
      legend.setVerticalAlignment(3);
      legend.setHorizontalAlignment(1);
      legend.setOrientation(0);
      legend.setDrawInside(false);
      legend.setYOffset(10);
      legend.setXOffset(10);
    }

    this.model.setExtraOffsets(10, 10, 10, 30);

    let xAxis = this.model.getXAxis();
    if (xAxis) {
      xAxis.setPosition(XAxisPosition.BOTTOM);
      xAxis.setDrawGridLines(false);
      xAxis.setGranularity(1);
      xAxis.setLabelCount(5);
      xAxis.setValueFormatter(new DateFormatter(this.labels));
      xAxis.setYOffset(5);
    }

    let rightAxis = this.model.getAxisRight();
    if (rightAxis) {
      rightAxis.setEnabled(false);
    }

    this.model.setDragEnabled(true);
    this.model.setScaleXEnabled(true);
    this.model.notifyDataSetChanged();
    this.model.setVisibleXRangeMaximum(5);
    this.model.moveViewToX(values.size() - 1);
    this.model.invalidate();
  }
  build() {
    NavDestination() {

      Column({space: 16}) {
        PageHeader({title: "总揽"})

        Stack() {
          LineChart({ model: this.model })
            .width("100%")
            .height(300)
        }
        .backgroundColor(Color.White)
        .borderRadius(16)
        .padding({ top: 8, bottom: 7 })
        .shadow({ radius: 16, color: $r("app.color.shade"), offsetX: 0, offsetY: 8 });
      }
      .width("100%")
      .height("100%")
      .padding({ left: 8, right: 8 })
    }
    .hideTitleBar(true);
  }
}