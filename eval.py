import json, sys
import argparse

def evaluate_yes_no(preds, labels):
    pred_list = []
    for pred in preds:
        pred = pred['answer']
        if pred.find('.') != -1:
            pred = pred.split('.')[0]
        pred = pred.replace(',', '')
        pred = pred.split(' ')
        if 'No' in pred or 'not' in pred or 'no' in pred:
            pred_list.append(0)
        else:
            pred_list.append(1)

    for i in range(len(labels)):
        label = labels[i]
        if label.find('.') != -1:
            label = label.split('.')[0]
        label = label.replace(',', '')
        label = label.split(' ')
        if 'No' in label or 'not' in label or 'no' in label:
            labels[i] = 0
        else:
            labels[i] = 1

    pos = 1
    neg = 0

    TP, TN, FP, FN = 0, 0, 0, 0
    for pred, label in zip(pred_list, labels):
        if pred == pos and label == pos:
            TP += 1
        elif pred == pos and label == neg:
            FP += 1
        elif pred == neg and label == neg:
            TN += 1
        elif pred == neg and label == pos:
            FN += 1

    # print('TP\tFP\tTN\tFN\t')
    # print('{}\t{}\t{}\t{}'.format(TP, FP, TN, FN))

    precision = float(TP) / float(TP + FP)
    recall = float(TP) / float(TP + FN)
    f1 = 2*precision*recall / (precision + recall)
    acc = (TP + TN) / (TP + TN + FP + FN)
    print('Accuracy: {}'.format(acc))
    print('Precision: {}'.format(precision))
    print('Recall: {}'.format(recall))
    print('F1 score: {}'.format(f1))


def main(path):
    with open(path, 'r') as f:
        labels = [json.loads(line)['gt_answer'] for line in f]

    with open(path, 'r') as f:
        preds = [json.loads(line) for line in f]

    evaluate_yes_no(preds, labels)

    

if __name__ == "__main__":

    for path in sys.argv[1:]:
        print(path)
        main(path)
        print()